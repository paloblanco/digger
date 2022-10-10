function mg(x,y)
    return mget(x,y)%16
end

function make_map()
    for x = 0,7,1 do
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
    poke(0x5f57,8) -- set map to 8 width
    pal({8,9,10,12})
    y=-10
    make_map()
end

function _update60()
    if (btn(2)) y -= 1
    if (btn(3)) y += 1
end

function _draw()
    camera(0,y)
    local ystart = y\12
    for yy=ystart,ystart+12,1 do
        for xx=0,7,1 do
            n = mg(xx,yy)
            rectfill(xx*16,yy*12,(xx+1)*16,(yy+1)*12,n)
        end
    end
end

