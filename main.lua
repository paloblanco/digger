-- thing code

thing = {}

function thing:init()
end

function thing:new(o)
    local o=o or {}
    local t={}
    for k,v in pairs(self) do
        if type(v) == "table" then
            newt = {}
            for kk,vv in pairs(v) do
                newt[kk]=vv
            end
            t[k]=newt
        else
            t[k] = v
        end
    end
    for k,v in pairs(o) do
        t[k] = v
    end
    setmetatable(t,self)
    self.__index=self
    t:init()
    return t
end

function contains(t,v)
    for _,each in pairs(t) do
        if (each==v) return true
    end
    return false
end
-- clusters



cluster = thing:new()
cluster.x0=0
cluster.y0=0

function cluster:init()
    self.blocks = {}
    self.color = mg(self.x0,self.y0)
    self:add_blocks(self.x0,self.y0)
    self:add_to_global_table()
    self.aboveme = {}
    self.belowme = {}
    self.stable = true
    self.calling = false -- true if currently checking stability
    self.falling = false
    self.confirmed = true -- have I confirmed recently that you are stable?
    self.timer = 2
end

function cluster:check_stable()
    local stable = false
    self.calling=true -- flag the first time I am checked
    for each in all(self.belowme) do
        if each.calling then
            do end -- break out of a circular reference
        elseif (each.confirmed and each.stable) or each.color==5 then
            stable = true
            self.stable=true
            self:set_confirmed(true)
            return true
        end
    end

    if not stable then
        for each in all(self.aboveme) do
            if ((not each.confirmed) and (not each.calling)) each:check_stable()
        end
    end

    self.stable=stable
    return self.stable
end

function cluster:add_blocks(x,y)
    if (contains(self.blocks,blockid(x,y))) return
    add(self.blocks,blockid(x,y))
    for each in all({{-1,0},{1,0},{0,-1},{0,1}}) do
        local xx=each[1] + x
        local yy=each[2] + y
        if mg(xx,yy) == self.color then
            self:add_blocks(xx,yy)
        end
    end
end

function cluster:add_to_global_table()
    for each in all(self.blocks) do
        map_clusters[each]=self
    end
    add(list_clusters,self)
end

function cluster:highlight(cc)
    cc = cc or 7
    for ix in all(self.blocks) do
        xx,yy = blockcoord(ix)
        rectfill(xx*12,yy*10,xx*12+12,yy*10+10,cc) 
    end
end

function cluster:add_support(other)
    if (not contains(self.belowme,other)) add(self.belowme,other)
    if (not contains(other.aboveme,self)) add(other.aboveme,self)
end

function cluster:check_supports()
    for ix in all(self.blocks) do
        xx,yy = blockcoord(ix)
        -- if yy < 100 and mg(xx,yy+1) != self.color then
        if yy < 100 and map_clusters[ix+9] != self then
            local oix = blockid(xx,yy+1)
            other = map_clusters[oix]
            if other and not contains(self.belowme,other) then
                self:add_support(other)
                if other.stable then
                    self.falling=false
                    self.stable=true
                end
            end
        end
    end
end

function cluster:remove_loop_supports()
    for c in all(self.belowme) do
        if #c.belowme == 1 and contains(c.belowme,self) then
            del(self.belowme,c)
        end
    end
end

function cluster:set_confirmed(f)
    f = f or false
    self.confirmed = f
    for c in all(self.aboveme) do
        if (c.confirmed != f) c:set_confirmed(f)
    end
end

function cluster:killme()
    for ix in all(self.blocks) do
        xx,yy = blockcoord(ix)
        mset(xx,yy,0)
        map_clusters[ix] = false
    end
    for b in all(self.aboveme) do
        del(b.belowme,self)
        b:set_confirmed(false)
    end
    for b in all(self.belowme) do
        del(b.aboveme,self)
    end
    for b in all(self.aboveme) do
        b:check_stable()
    end
    del(list_clusters,self)
end

function cluster:set_stable()
    self.stable=true
    self.falling=false
    for a in all(self.aboveme) do
        if (not a.stable) a:set_stable()
    end
end

function cluster:fall()
    local old_blocks = {}
    for ix,bix in pairs(self.blocks) do
        bixnew = bix+9
        self.blocks[ix] = bixnew
        add(old_blocks,bix)
        xx,yy = blockcoord(bixnew)
        mset(xx,yy,self.color)
        map_clusters[bixnew] = self
    end
    for b in all(old_blocks) do
        if (not contains(self.blocks,b) and (map_clusters[b] == self)) then
            map_clusters[b] = false
            xx,yy = blockcoord(b)
            mset(xx,yy,0)
        end
    end
end

function mg(x,y)
    return mget(x,y)%16
end

function blockid(x,y)
    return x + 9*y
end

function blockcoord(id)
    return id%9,(id\9)
end

function link_clusters()
    for _,c in pairs(map_clusters) do
        c:check_supports()
    end
end

function make_clusters()
    map_clusters = {} -- clusters indexed by id. has repeats
    list_clusters = {} -- clusters in a sequential list. no repeats.
    for xx = 0,8,1 do
        for yy = 0,100,1 do
            if not map_clusters[blockid(xx,yy)] then
                cluster:new{x0=xx,y0=yy} 
            end
        end
    end
end

function make_map()
    for y = 0,99,1 do
        for x = 0,8,1 do
            n = 1+rnd(4)\1
            -- if (n == mg(x-1,y)) n+=16
            -- if (n%16 == mg(x,y-1)) n+=32
            mset(x,y,n)
        end
    end
    y=100
    for x = 0,8,1 do
        mset(x,y,5)
    end
end

function fix_map_tiling()
    for y = 0,100,1 do
        for x = 0,8,1 do
            n = mg(x,y)
            if (n == mg(x-1,y)) n+=16
            if (n%16 == mg(x,y-1)) n+=32
            mset(x,y,n)
        end
    end
end

function kill(x,y)
    m = mg(x,y)
    if (m == 0) return
    mset(x,y,0)
    for n in all({{1,0},{-1,0},{0,1},{0,-1}}) do
        if (mg(x+n[1], y+n[2]) == m) kill(x+n[1],y+n[2])
    end	
end

function _init()
    poke(0x5f57,9) -- set map to 8 width
    pal({8,9,2,12})
    cy=-10
    make_map()
    fix_map_tiling()
    make_clusters()
    link_clusters()
    -- dummy code for block falling
    target = {}
    target.x = 0
    target.y = 0
end

function turn()
    if (btnp(0)) target.x -= 1
    if (btnp(1)) target.x += 1
    if (btnp(2)) target.y -= 1
    if (btnp(3)) target.y += 1
    if (btnp(4)) then
        local ix = blockid(target.x,target.y)
        if (map_clusters[ix]) map_clusters[ix]:killme()
    end
    local fallcheck = {}
    for each in all(list_clusters) do
        each.confirmed=true
        each.calling=false
        if each.falling then
            each:fall()
            add(fallcheck,each)
        elseif (not each.stable) and (not each.falling) then
            each.falling = true
        end
    end
    for each in all(fallcheck) do
        each:check_supports()
        if (each.stable) each:set_stable()
    end
    fallcheck=nil
    fix_map_tiling()
end

function _update60()
    if (btnp()>0) turn()
    local deltay = target.y*10 - cy - 30
    cy += deltay/10
    if (abs(deltay) < 1) cy = target.y*10 - 30
end

function get_cluster_xy(x,y)
    local ix = blockid(x,y)
    return get_cluster_ix(ix)
end

function get_cluster_ix(ix)
    return map_clusters[ix] or false
end

function _draw()
    camera(0,cy)
    cls()
    local ystart = cy\10
    for yy=ystart,ystart+13,1 do
        for xx=0,8,1 do
            n = mget(xx,yy)
            local xb = xx*12
            local yb = yy*10
            rectfill(xb, yb, xb + 12, yb + 10, n)
            if ((n\16)%2 == 0) line(xb, yb, xb, yb+10, 0)
            if ((n\16) < 2) line(xb, yb, xb+12, yb, 0)
            local clust = get_cluster_xy(xx,yy)
            if clust and not clust.stable then
                if (60*t()%24<12) clust:highlight(0)
            end
        end
    end
    cluster_now = map_clusters[blockid(target.x,target.y)]
    if cluster_now then
        cluster_now:highlight(7)
        for b in all(cluster_now.belowme) do
            b:highlight(15)
        end
        for b in all(cluster_now.aboveme) do
            b:highlight(14)
        end
    end
    print("x",(target.x*12)+5,(target.y*10)+3, 1)
end

