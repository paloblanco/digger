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

-- all_clusters = {} -- added to init

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
end

function cluster:add_blocks(x,y)
    if (contains(self.blocks,blockid(x,y))) return
    add(self.blocks,blockid(x,y))
    for each in all({{-1,0},{1,0},{0,-1},{0,1}}) do
        local xx=each[1] + x
        local yy=each[2] + y
        if mg(xx,yy) == self.color then
            -- print("adding block "..xx.." "..yy)
            -- flip()
            self:add_blocks(xx,yy)
        end
    end
end

function cluster:add_to_global_table()
    for each in all(self.blocks) do
        all_clusters[each]=self
    end
end

function cluster:highlight(cc)
    cc = cc or 7
    for ix in all(self.blocks) do
        xx,yy = blockcoord(ix)
        rectfill(xx*12,yy*10,xx*12+12,yy*10+10,cc) 
    end
end

function cluster:add_support(other)
    add(self.belowme,other)
    add(other.aboveme,self)
end

function cluster:check_supports()
    for ix in all(self.blocks) do
        xx,yy = blockcoord(ix)
        if yy < 99 and mg(xx,yy+1) != self.color then
            local oix = blockid(xx,yy+1)
            other = all_clusters[oix]
            if not contains(self.belowme,other) then
                self:add_support(other)
            end
        end
    end
end

function cluster:killme()
    for ix in all(self.blocks) do
        xx,yy = blockcoord(ix)
        mset(xx,yy,0)
        all_clusters[ix] = false
    end
    for b in all(self.aboveme) do
        del(b.belowme,self)
    end
    for b in all(self.belowme) do
        del(b.aboveme,self)
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
    for _,c in pairs(all_clusters) do
        c:check_supports()
    end
end

function make_clusters()
    all_clusters = {}
    for xx = 0,8,1 do
        for yy = 0,99,1 do
            if not all_clusters[blockid(xx,yy)] then
                cluster:new{x0=xx,y0=yy} 
            end
        end
    end
end

function make_map()
    for x = 0,8,1 do
        for y = 0,99,1 do
            n = 1+rnd(4)\1
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
    if (btnp(4)) kill(target.x, target.y)

end

function _update60()
    if (btnp()>0) turn()
    local deltay = target.y*10 - cy - 30
    cy += deltay/10
    if (abs(deltay) < 1) cy = target.y*10 - 30
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
        end
    end
    cluster_now = all_clusters[blockid(target.x,target.y)]
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

