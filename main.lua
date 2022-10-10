function mg(x,y)
    return mget(x,y)%16
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
    y=-10
    make_map()
end

function _update60()
    if (btn(2)) y -= 1
    if (btn(3)) y += 1
end

function _draw()
    camera(0,y)
    cls()
    local ystart = y\10
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
end

