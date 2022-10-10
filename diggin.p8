pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
h=0.19z=1o=-64u=0c=0a=60b=-80p=60s=0w=0
function g(x,y)
return mget(x,y)%16
end
function rm()
?"\acc.ee.gg.ee.gg"
v=-120
for x=0,7,1do
for y=0,99,1do
n=1+rnd(3)\1
if(y>0and rnd()<h)n=4
if(n==g(x-1,y))n+=16
if(n%16==g(x,y-1))n+=32
mset(x,y,n)
end
end
end
poke(0x5f57,8)pal({13,14,3,8})rm()
function k(x,y)
m=g(x,y)
if(m==0)return
if(m==4)c+=30circfill(a+8,b+8,20,0)flip()circ(a+8,b+8,20,6)flip()
mset(x,y,0)
for n in all({{1,0},{-1,0},{0,1},{0,-1}})do
if(g(x+n[1],y+n[2])==m)k(x+n[1],y+n[2])
end	
end
function _update60()
xo=0q=0u=0yo=0s=s*.8w=w*.9
if(btn(0))q=-1
if(btn(1))q=1
a+=q
if btnp(4)and d>0then
k(q+(a+8)\16,1-abs(q)+(b+8)\16)s=q*6w=6*(abs(q)-1)?"\aa1"
end
p=1b+=p
l=g((a+1)\16,(b+8)\16)r=g((a+12)\16,(b+8)\16)d=g((a+8)\16,(b+16)\16)	
if(l>0)a=-1+((a+8)\16)*16
if(r>0)a=4+((a)\16)*16
a=min(max(a,0),115)
if(d>0)b=((b)\16)*16p=0
o=b-36c=max(0,c-1)
if(l==4or r==4or d==4or c>0)u=1?"\ac0e-0g0"
v+=.33+h+u
if(b>1640)z+=1h+=.02b=-80rm()
if v>b+12then
?"\ac1...e-1...g1...e-1...c1"
while true do
?"\^w\^tnice diggin'",20,o+20,0
?"depth: "..((100*(z-1)+b\16+1).." m"),20,o+34,0
?"palo blanco games, 2022",20,o+42,0
flip()
end
end
sy=o\16
if(u>0and(30*t())%2>0)xo=-1+rnd(3)yo=-1+rnd(3)
camera(0+xo,o+yo)
for x=0,7,1do
for y=sy,sy+9,1do
n=mget(x,y)e=x*16f=y*16rectfill(e,f,e+16,f+16,n)
if(n%16==4)rect(e+1,f+1,e+15,f+15,8+10*t()%2)
if((n\16)%2==0)line(e,f,e,f+16,0)
if((n\16)<2)line(e,f,e+16,f,0)
end
end
camera(-a-s,o-b+abs(q)*15*t()%2+w)?"\^w\^t웃",0,6,8
pset(5+q,8+p,0)pset(8+q,8+p,0)camera(0,o)
if(z<2and b<0)?"\^w\^thot diggin'",24,b-30,8
if(b<0)?"\^w\^tlevel "..z,36,b-16,8
rectfill(0,-140,128,v,8)line(124,o+10,124,o+118,7)circ(124,o+10 + 108*(b/1600),2,8)rectfill(122,o,126,o+10+108*(v/1600),8)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000888880
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000888880
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000888880
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000888880
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000888880
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000088008800008888008888880000000000888800008888880000888800008888008888880088880000008800000000000000088800
00000000000000000000000088008800008888008888880000000000888800008888880000888800008888008888880088880000008800000000000000800080
00000000000000000000000088008800880088000088000000000000880088000088000088000000880000000088000088008800880000000000000000800080
00000000000000000000000088008800880088000088000000000000880088000088000088000000880000000088000088008800880000000000000000800080
00000000000000000000000088888800880088000088000000000000880088000088000088000000880000000088000088008800000000000000000000088800
00000000000000000000000088888800880088000088000000000000880088000088000088000000880000000088000088008800000000000000000000007000
00000000000000000000000088008800880088000088000000000000880088000088000088008800880088000088000088008800000000000000000000007000
00000000000000000000000088008800880088000088000000000000880088000088000088008800880088000088000088008800000000000000000000007000
00000000000000000000000088008800888800000088000000000000888888008888880088888800888888008888880088008800000000000000000000007000
00000000000000000000000088008800888800000088000000000000888888008888880088888800888888008888880088008800000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000088000000888888008800880088888800880000000000000088880000000000000000000000000000000000007000
00000000000000000000000000000000000088000000888888008800880088888800880000000000000088880000000000000000000000000000000000007000
00000000000000000000000000000000000088000000880000008800880088000000880000000000000000880000000000000000000000000000000000007000
00000000000000000000000000000000000088000000880000008800880088000000880000000000000000880000000000000000000000000000000000007000
00000000000000000000000000000000000088000000888800008800880088880000880000000000000000880000000000000000000000000000000000007000
00000000000000000000000000000000000088000000888800008800880088880000880000000000000000880000000000000000000000000000000000007000
00000000000000000000000000000000000088000000880000008888880088000000880000000000000000880000000000000000000000000000000000007000
00000000000000000000000000000000000088000000880000008888880088000000880000000000000000880000000000000000000000000000000000007000
00000000000000000000000000000000000088888800888888000088000088888800888888000000000088888800000000000000000000000000000000007000
00000000000000000000000000000000000088888800888888000088000088888800888888000000000088888800000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000008888880000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000008888880000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000008088080000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000008888880000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000888888888800000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000888888888800000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000008888880000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000008888880000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000008800880000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000008800880000000000000000000000000000000000000000000000000000007000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddddddddddddddddddddddd03333333333333330ddddddddddddddd0eeeeeeeeeeeeeee0ddddddddddd7ddd
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
088888888888888888888888888888880eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0ddddddddddddddd03333333333333330ddddddddddddddd0333333333337333
00000000000000000000000000000000000000000000000000000000000000000ddddddddddddddd033333333333333300000000000000000000000000007000
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
0eeeeeeeeeeeeeee0ddddddddddddddd088888888888888803333333333333330ddddddddddddddd033333333333333333333333333333330ddddddddddd7ddd
00000000000000000000000000000000000000000000000000000000000000000ddddddddddddddd000000000000000000000000000000000000000000007000
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
08888888888888880eeeeeeeeeeeeeee033333333333333308888888888888880ddddddddddddddddddddddddddddddd08888888888888880333333333337333
00000000000000000eeeeeeeeeeeeeee033333333333333308888888888888880000000000000000000000000000000000000000000000000000000000007000
0ddddddddddddddd0eeeeeeeeeeeeeee033333333333333308888888888888880eeeeeeeeeeeeeee03333333333333330eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee033333333333333308888888888888880eeeeeeeeeeeeeee03333333333333330eeeeeeeeeeeeeee0ddddddddddd7ddd
0ddddddddddddddd0eeeeeeeeeeeeeee033333333333333308888888888888880eeeeeeeeeeeeeee03333333333333330eeeeeeeeeeeeeee0ddddddddddddddd
0ddddddddddddddd0eeeeeeeeeeeeeee033333333333333308888888888888880eeeeeeeeeeeeeee03333333333333330eeeeeeeeeeeeeee0ddddddddddddddd
0ddddddddddddddd0eeeeeeeeeeeeeee033333333333333308888888888888880eeeeeeeeeeeeeee03333333333333330eeeeeeeeeeeeeee0ddddddddddddddd
0ddddddddddddddd0eeeeeeeeeeeeeee033333333333333308888888888888880eeeeeeeeeeeeeee03333333333333330eeeeeeeeeeeeeee0ddddddddddddddd
0ddddddddddddddd0eeeeeeeeeeeeeee033333333333333308888888888888880eeeeeeeeeeeeeee03333333333333330eeeeeeeeeeeeeee0ddddddddddddddd
0ddddddddddddddd0eeeeeeeeeeeeeee033333333333333308888888888888880eeeeeeeeeeeeeee03333333333333330eeeeeeeeeeeeeee0ddddddddddddddd
0ddddddddddddddd0eeeeeeeeeeeeeee033333333333333308888888888888880eeeeeeeeeeeeeee03333333333333330eeeeeeeeeeeeeee0ddddddddddddddd
0ddddddddddddddd0eeeeeeeeeeeeeee033333333333333308888888888888880eeeeeeeeeeeeeee03333333333333330eeeeeeeeeeeeeee0ddddddddddddddd
0ddddddddddddddd0eeeeeeeeeeeeeee033333333333333308888888888888880eeeeeeeeeeeeeee03333333333333330eeeeeeeeeeeeeee0ddddddddddddddd
