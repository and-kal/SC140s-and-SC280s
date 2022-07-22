// Some #SC140 tweets that I took from this repo:
// https://github.com/celesteh/sc140/blob/master/data/rss.xml

---
play{f=LocalIn.ar(2).tanh;k=Latch.kr(f[0].abs,Impulse.kr(1/4));LocalOut.ar(f+CombC.ar(Blip.ar([4,6],100*k+50,0.9),1,k*0.3,50*f));f} 

---
f={|t|Pbind(\note,Pseq([-1,1,6,8,9,1,-1,8,6,1,9,8]+5,319),\dur,t)};Ptpar([0,f.(1/6),12,f.(0.1672)],1).play 

---
play{a=SinOsc;mean({|i|b=a.ar(a.ar(j=i+0.99)/9,a.ar(a.ar(j/99))*9,j*9).tanh;Pan2.ar(a.ar(b.exprange(j*99,j+1*99)+i),b)}!9)} 

---
play{a=SinOsc;Normalizer.ar(Splay.ar(a.ar(811+b=(2..8),a.ar((c=a.ar(0.1/b,b))&lt;0*9*b+855+(9/b),a.ar(899/b)*2,2).tanh*6,c)))} 

---
play{a=LFNoise2;b=LFPar;c=(1..8).choose;Splay.arFill(8,{Saw.ar([55,110].choose+a.kr(1/8),b.kr(1/8).fold(b.kr(c/2),b.kr(c)*2))})} 

---
play{a=SinOsc;tanh(a.ar(3e-3,DelayC.ar(Ringz.ar(b=InFeedback.ar(1),[9,12],a.ar(c=1/[3,4])+15),1,a.ar(0,b.lag3(1))/9+0.5)))} 

---
( { SendPeakRMS.kr(In.ar(0, 2), 5, 3, "/replyAddress") }.play(RootNode(Server.default), nil, \addToTail); )
---
play{a=SinOsc;b=(2,4..20);CombN.ar(Splay.ar(HPF.ar(a.ar(0,Duty.ar(2/b,0,Dseq(b,inf)).lag2(a.ar(1/b,b)%1)*2pi),9)),1,2/3,4)} 

---
play{a=LFSaw;Splay.ar(BLowPass4.ar(b=a.ar(a.ar(c=3/(1..12),d=c/3*2,99/c+99,900+c)),c*999+a.ar(c),a.ar(c,d)%1+0.01*2)).tanh} 

---
play{LPF.ar(Saw.ar(110.07)+Saw.ar(110.13),SinOsc.ar(15).range(220,10000)).dup*0.1};  

---
play{a=Pulse;c=a.ar(b=[4,1,5,8,3],d=b/9).lag(1/b);Splay.ar(a.ar(b*99*a.ar(b,1/4,1,1.01)|a.ar(d,d,98,99).lag(c%1),c/2+0.5))} 

---
play{a=LFSaw;Splay.ar(CombN.ar(Blip.ar(a.ar(b=(1..5)).ceil*(a.ar(1/b)*30+60)+99,a.ar(0.2/b).round(1/3)*8+9).tanh,4,4/b,9))} 

---
f={|x|x.collect{|x|x*x}.sum.sqrt}.flop;{a={rrand(4,18)}!8;z=a++f.(a.powerset).flat;Splay.ar(Ringz.ar(Impulse.ar(4/z),z*440,0.1))}.play; 

---
Ndef(\x, { a=3; b=2; z = [a,b,(a*a) + (b*b) ** 0.5]; Splay.ar(Ringz.ar(Impulse.ar(4/z), z*440*(Ndef.ar(\x)+1), 0.2)) }).play;  

---
play { Ringz.ar(TDuty.ar(Dseq(20 / "I'm sitting in a ringz".ascii, inf)).lag(0.001), 0, 1).clip / 2 }  

---
play { Splay.ar("Zum Wohl!".ascii.collect{|c, i|Ringz.ar(Impulse.ar(1, 1/5 * i), c * 4, 2, 0.1)}.scramble) } 

---
play {Splay.ar({SinOsc.ar(Select.kr(SinOsc.kr(0.1)*4, {Duty.ar(1/14, 0, Dseq({ 1.0.rand}!4,inf)) }!16)*500+800)} ! 4)*0.1}  

---
a=Dseq("tnnerbinu".reverse.postln.ascii,inf)*_; play { Splay.ar(Impulse.ar(1.03 ** Duty.ar(a!8, 0, a.(1)))) };   

---
Pdef(\x, Ppar(Pbind(\freq, Pbrown(2000, 8000, 1), \dur, 0.05, \pan, Pbrown(-1,1,0.2))!4)).play;  

---
play{RecordBuf.ar(SinOsc.ar(LFNoise0.kr(1!8)*550+600),b=LocalBuf(1e5,8));Splay.ar(BufRd.ar(8,b,LFNoise1.ar(1!4).max(0)*1e5))*0.1} 

---
f = Duty.kr(_, 0, Dseq("hi scott".ascii, inf)); play { RLPF.ar(Saw.ar(f.(1/8)), f.(1/7)*8, 0.1)  }   

---
f=_.rand;g=EnvGen.kr(Env(f!10,f!9/9).circle).linexp(0,10,_,_); play{Splay.ar({RHPF.ar(Saw.ar(g.(10,5e3))*g.(0.1,1),g.(1e3,1e4))}!8)};  

---
play{Splay.ar(Ringz.ar(Impulse.ar((0..60)*2+8.5), (20..80).midicps, 0.01) * LFNoise2.kr(0.1 ! 60).max(0))} 

---
play{Splay.ar(Impulse.ar((20..80).midicps) * LFNoise2.kr(0.1 ! 60).max(0))} 

---
play{Splay.ar({Klank.ar(`[{exprand(90pi,1e3)}!3,1,0.3.rand],TDuty.ar(Dshuf(0.6!(59.rand+8)++5.rand,inf))) }!16)*0.2} 

---
play { Splay.ar({ Klank.ar(`[{exprand(90pi,1e3)}!3, 1, 0.3.rand], TDuty.ar(Dshuf(0.6!(59.rand+8)++5.rand,inf))) }!16) * 0.2 } 

---
a={exprand(90pi,15e4)}!9;{({b=0.3.rand;Klank.ar(`[a.scramble[0..3],b,b],TDuty.ar(Dshuf(2!(59.rand+8)++b/7,inf)))}!16).sum*0.2}.play; 

---
a={exprand(90pi,15e4)}!9; b=1.0.rand; {({Klank.ar(`[a.scramble[0..3],b,b],TDuty.ar(Dshuf(2!(59.rand+8)++b/7,inf)))}!16).sum*0.2}.play;  

---
{({t = TDuty.kr(Dseq(1!(16.rand+8)++(1/16!6.rand),inf));Decay.kr(t, 0.4.rand)*SinOsc.ar(600.0.rand+300)}!16).sum*0.2}.play;  

---
{ Splay.ar(SinOsc.ar({ Spring.ar(LFNoise0.ar(1.0.rand + 1), 0.9.rand, 0.009.rand).exprange(210, 4300) } ! 14)) *0.1 }.play;  

---
Ndef(\,{ TDuty.ar(Ndef.ar(\_,2),0,0.5) }).play; Ndef(\_,{ Demand.ar(Ndef.ar(\).reverse,0, Dseq({ 0.3.rand } ! 14, inf)) }); 

---
Ndef(\,{ Impulse.ar(Ndef.ar(\_,2)) }).play; Ndef(\_,{ 200 - PulseCount.ar(Ndef.ar(\).reverse, Dust.ar(0.5!2)) }); 

---
f={|x,n|if(n&gt;0,{ f.(SelectX.ar(LFTri.kr(1/n.rand)*n,{SinOsc.ar(30 exprand:2e4)*x}!n),n-1)},x/2)}; play{Splay.ar(f.(1,6))/8} 

---
play { Limiter.ar(Ringz.ar(Impulse.ar(10, LFNoise0.kr(2!2)), 0)) * 0.1 } 

---
a = {|x,n| if(n&gt;0) { a.(SinOsc.ar(MouseX.kr(3, 5)**(n-1)*x, x*[1,-1]), n - 1) } {x} }; play { a.(40, rrand(3, 10)) * 0.1} 

---
a=SinOsc.ar(_,1,_);b=exprand(_,_);play{ a.(a.({a.(a.(b.(1e-2,1e1),b.(1e-2,1e1)),b.(1e1,1e3))}!2,b.(5e1,4e3)),1e-1) }; 

---
a=SinOsc.ar(_,1,_);b=exprand(_,_);play{ a.({a.(a.(a.(b.(1e-2,1e1),b.(1e-2,1e1)),b.(1e1,1e3)),b.(5e1,4e3))}!2,1e-1) }; 

---
a=SinOsc.ar(_,1,_);b=exprand(_,_);play{ a.(a.(a.(a.(b.(1e-2,1e1),b.(1e-2,1e1)),b.(1e1,1e3)),{b.(5e1,4e3)}!2),1e-1) }; 

---
a=SinOsc.ar(_,1,_);b=exprand(_,_);play{ a.(a.(a.(a.({b.(1e-2,1e1)}!2,b.(1e-2,1e1)),b.(1e1,1e3)),b.(5e1,4e3)),1e-1) }; 

---
f=Impulse.ar(_);play{t=[20,0,10].rand;a=EnvGen.kr(Env([1,1,35,20],t)); b=1.05**a/80;Ringz.ar(f.(a)*Trig.ar(f.(0),t.sum),2000+1000.rand,b)/4} 

---
play{g=LFSaw.kr(_);f=g.(g.([0.1,0.11]).range(0.1,10));z=LFPulse.kr(10,0,f).product;Splay.ar(z.lag+1*z*SinOsc.ar(11400,f))/5} 

---
play{f=LFSaw.kr(LFSaw.kr([1,1.1]*0.1).range(0.01, 10));z=LFPulse.kr(10,0,f).product; Splay.ar(z.lag+1*z*SinOsc.ar((8..17)*40,f))/5}  

---
Ndef(\x, { ring1(SinOsc.ar(234*XLine.kr(0.1,1,5)+LFNoise2.kr(2!2, 5)),DelayC.ar(Ndef(\x).ar.reverse,0.03,0.02+(Ndef(\x).ar*0.001)))}).play; 

---
Ndef(\x, { var r = SinOsc.ar(Ndef(\x).ar, [0, pi]); Splay.ar(max(sin(r[0] * ({ exprand(1.0, 3000.0)}!8) + LFNoise1.kr(1!8)),0))*0.4 }).play; 

---
{Pulse.ar(Select.kr(LFSaw.kr(10).range(0,3), [1,1.25,1.5] * 440)) * LFPulse.kr(0.2, 0, 0.25) }.play;  

---
var f={rrand(1, 2.1)}; {Splay.ar(SinOsc.ar(SinOsc.ar(0.02 * (f!8)).sum.round(f!8) * (f!8+1) + 1 * 100)) * 0.1}.play; 

---
var f={rrand(0.2, 2.0)}; {Splay.ar(SinOsc.ar(SinOsc.ar(0.02 * (f!8)).sum.round(f!8) * (f!8+1) * 100)) * 0.1}.play; 

---
/*eclecticity*/ Ndef(\x, { SinOsc.ar(BrownNoise.ar(30!2, 200), Ndef(\x).ar * LFNoise1.kr(1!2,1,1)) }).play; 

---
play{k={|a,b|a*pow(b,LFNoise1.ar(0.2)+1/2)};RLPF.ar(Pulse.ar(Duty.kr(1/11,0,Dseq([-3,0,2,0,7,5,7,9]+35,inf)).midicps),k.(300,10),k.(0.1,5))} 

---
{play{x=Impulse.ar(0.05);20.do{x=LPF.ar(AllpassL.ar(LeakDC.ar(x),4,8**kr(n=LFNoise2,0s)/2,8)*1.2,8**n.kr({0s.rand}!2)*2500,1).tanh};x*5}}!4 

---
play{mean({|j|i=j+1;CombC.ar(x=0.5**i*Pluck.ar(a=Saw.ar(1/i+1/6),a,1,1/i/(3-LFPulse.ar(1/i))/30,9,1b/i),1,SinOsc ar:i+[4,9]*1e-3,0)-x}!9)/9} 

---
play{mean({|i|99**(-1-LFSaw.kr(i+1/180,1))*SinOsc.ar(i+1*55)}!48)!2}  

---
play{x=Saw.ar(0.7**lag(kr(n=LFNoise0,1/5),2)*[601,500,749]);Splay.ar({|i|x=x+BAllPass.ar(x,9**n.kr(a=1b**i)*2e3)+CombL.ar(x,1,a,8)/2s}!9@8)} 

---
play{Splay.ar(x=sin(CombL.ar(LPF.ar(InFeedback.ar(20,99),2e3),1,LFNoise1.kr(1e-3!99)+1/99,0.05)+Dust2.ar(0.01!99)))++(0!18)++(x-x.rotate/2)} 

---
x=(1..8);y=scramble(8/x);z=y/.x y;d={|d,a|Duty.ar(d,0,Dseq(a,inf))};play{d.(d.(0.16,z*.x z)/4e3,z)/5-d.(d.(0.04,x*2)/8e2,[0,1])/3!2} 

---
play{Splay.ar(a={|i|RLPF.ar(Trig.ar(InFeedback.ar(i+[-1,1]%6+2).sum.abs.lag(1e-3)&lt;1e-4,8e-3),{2**10.rand*20}!4,1e-3,0s).mean.sin}!6,0.5)++a} 

---
play{CombL.ar(InFeedback ar:0,1,1/4,9).sin+Pluck.ar(ar(n=LFNoise1,400),a=LFNoise0.kr(1/2),1,1/a.abs/200,99)*SinOsc.ar(n.kr(1/8)*[6,6s])*0.8} 

---
play{ar(r=RLPF,Saw.ar([200,302]).mean,5**(n={LFNoise1.kr(1/8)})*1e3,0.6)+r.ar(Saw ar:Amplitude.kr(3**n*3e3*InFeedback.ar(0)+1,4,4),1e3)/5!2} 

---
play{f=({|i|DelayC.ar(0-LPF.ar(InFeedback.ar(2+i),2000).tanh,1,1.5**i/4e3)}!6);Splay.ar(f)++(Dust.ar(f*2e4+1)*LFSaw.kr(3/4**(0..5)/8)/5+f)} 

---
play{x=mean({|i|LPF.ar(DelayC.ar(LeakDC.ar(InFeedback ar:2,1-y=1e-4),2,40**LFNoise2.ar(0.8**i)/20),1e4.rand)}!40);[x,x,x+Trig1.ar(y+x,2*y)]} 

---
play{(x=AllpassN.ar(mean(DelayL.ar(LeakDC.ar(InFeedback ar:2),1,1+((a=LFNoise2.ar(0.1))*[1,-1])/50)),1,[1,1.01],20))/5++(x+SinOsc.ar(24,x))} 

---
play{CombN.ar(x=mean(DelayL.ar(LeakDC.ar(InFeedback.ar(2)),1,1+(LFNoise0.kr(1/6)*[1,-1])/50)),1,1,[30,-30])/8++(CuspN.ar(800)+x)} 

---
play{CombN.ar(x=LPF.ar(mean(DelayL.ar(LeakDC.ar(InFeedback.ar(2)),1,1+(LFNoise0.kr(4)*[1,-1])/180)),1e3),1,1/2,[8,4])*9++(x+Impulse.ar(4))} 

---
play{DelayN.ar(x=RLPF.ar(Saw ar:Duty.kr(1/4,0,Dseq(2**([0,3,5,7]+.x flat([5,5,0,3]!8)/12)*90,inf)),0.1**LFSaw.kr(4,1)*200),1,1/8)*1.4+x/2!2} 

---
play{b=LFTri.kr(1/6);CombN.ar(a=sum({BPF.ar(b&lt;0+(b&gt;0.3)*PinkNoise.ar(1!2)*b,b&gt;0.29+0.2*exprand(30,1e4),0.3**2.0.rand/8)}!30),1,1/40,-0.02)} 

---
play{RLPF.ar(Saw.ar(Duty.kr([1/8,1],0,Dseq(2**flop([[0,0,2,3],-99!4++[24,22,20,19]]/12)*99,inf))),0.2**[LFSaw.kr(8,1),LFTri.kr(1,1)]*300)} 

---
play{Splay.ar({BPF.ar(LFNoise1.kr(1/16)&gt;0.5*9*Saw.ar(4**6.0.rand)*LFPulse.ar(2**11.rand/32,8.rand/8,0.5.rand),2**9.0.rand*20,0.5.rand)}!99)} 

---
play{Splay.ar({BPF.ar(PinkNoise.ar(20)*LFPulse.ar(2**rrand(-2,2),rand(4)/4,0.5.rand)*(LFNoise1.kr(1/4)&gt;0),exprand(50,15000),1.0.rand)}!10)} 

---
f=FreqShift;play{f.ar(Saw.ar(40),-500)*Line.kr(1,0)+f.ar(DelayN.ar(InFeedback.ar*5,0.13,0.13),40)+f.ar(Saw.ar,Line.kr(3e3,0,3,1,0,2))/5!2} 

---
Ndef(\,{CombN.ar(BPF.ar(Saw.ar(1/8)*1e5+CuspN.ar*1e-3-Ndef(\).ar/40,200,4),1,LFNoise0.ar(1/8).lag+2/[2.02,3]/99++4,9).sum.tanh!2}).play 

---
Pbind(\dur,1/6,\note,Pseq(stutter(x=[0,7,12,7,-2,5,10,5,-7,0,5,7,8,7,5];x=x++7++x++3!4;y=0!8++[5,3,2,0,3,2,0,-2]+5!4;flat(x++y)-8),4)).play 

---
play{l=LFSaw;SinOsc.ar(15**(l.kr(-4.8,1)*l.kr(-1.8,1))*20).sqrt+(99**l.kr(-0.6,0.5)/99*CuspL.ar)+Blip.ar(0.8,1+LFNoise0.kr(0.2)*3e3,4)!2/4} 

---
play{s=SinOsc;f=Duty.kr(0.8,0,Dseq([5,5,9,8]*9,inf));RLPF.ar(Pulse ar:f,4**s.ar(4**LFNoise1.kr(1.2)*4)*4*f)+s.ar(9**LFSaw.kr(-2.5,1)*9)/4!2} 

---
p={|x,a,f|9.do{x=BAllPass.ar(x*a,f).tanh};x};play{i=Dust.ar(2);p.(Dust.ar(EnvGen.ar(Env.perc,i,1e3,0,1).poll),1.4,50)/9+p.(i,1.8,40)!2} 

---
fork{{play{LPF.ar(PinkNoise.ar,100)*Pulse.ar(XLine.kr(2000,1500,2))*EnvGen.kr(Env.triangle(2),1,1,0,1,2)!2};2.0.rand.wait}!20}  

---
p={|x,a,f|9.do{x=BAllPass.ar(x*a,f).tanh};x};play{p.(Dust.ar(XLine.kr(1e4,0.01,5)*XLine.kr(0.001,1,0.8)),1.2,50)/2+p.(Impulse.ar(0),2,40)!2} 

---
play{x = PinkNoise.ar(0.1!2);x+FreqShift.ar(x, [0.15,0.1501])}  

---
f=0;{inf.do{|i|f=f+log2(2*i%6+1+floor(f)/(i%5+1))%2;play{SyncSaw.ar(2**f*99+[0,1],i%8+2*52)*Line.kr(0.1,0,1,1,0,2)};0.3.wait}}.r.play 

---
play{GVerb.ar(VarSaw.ar(Duty.ar(1/5,0,Dseq(x=[[4,4.5],[2,3,5,6]];flat(x*.x allTuples(x*.x x)*4).clump(2)++0)),0,0.9)*LFPulse.ar(5),99,5)/5} 

---
t={|u,d,a|u.ar(Duty.ar(d/5,0,Dseq(a++0))*300)};play{t.(Saw,1,x=[6,5,9,8];flat(y=allTuples(x/.t x)[(127..0)+[0,127]]%1))+t.(LFTri,4,y*2)!2/6} 

---
play{GVerb.ar(Saw.ar(Duty.ar(1/5,0,Dseq(x=[6,5,9,8];allTuples(x/.t x)[(127..0)+[0,127]].flat%1*300++0))),65,5)/3}  

---
play{GVerb.ar(Pulse.ar(Duty.ar(1/8,0,Dseq(x=[5,2,7,3];1/flat(allTuples(x/.t x).reject(any(_,{|i|i%1==0}))%1)*.x[1,3,2,6]*40++0))),165,7)/5} 

---
play{GVerb.ar(Saw.ar(Duty.ar(1/8,0,Dseq(x=[5,2,[9,7],3];1/(flat(allTuples(x/.t x).reject(any(_,{|i|i%1==0}))/.-1 x)%1)*30,inf))),165,5)/5} 

---
play{GVerb.ar(Saw.ar(Duty.ar(1/8,0,Dseq(x=[5,2,9,3];1/(flat(allTuples(x/.t x).reject(any(_,{|i|i%1==0}))/.-1 x)%1)*30,inf))),165,5)/5} 

---
play{GVerb.ar(LFTri.ar(Duty.ar(Dseq([3,1]/12,inf),0,Dseq(x=(3..6);allTuples(x/.t x).flat*[100,200,400],inf))),25,5)/5}  

---
x=Ndef(\x,Pbind(\freq,Pseq(a=(3..5);a*.x a*.x[4,8],8)));Ndef(\,{Limiter ar:GVerb.ar(PitchShift.ar(Ndef ar:\,1,2,0,0.1),20,20)/4+x.ar}).play 

---
x=Ndef(\x,Pbind(\freq,Pseq(a=(3..5);a/.x a*.x[40,80],8)));Ndef(\,{Limiter ar:GVerb.ar(PitchShift.ar(Ndef ar:\,1,2,0,0.1),30,9)/4+x.ar}).play 

---
(
---
play{a=LFNoise1;SinOsc.ar(round(VarSaw.ar(a.kr(10,0.1),0,1)*a.kr(1!2!2,400),a.kr(1/50,32,76))).tanh} 

---
{BPF.ar(DynKlang.ar(`[[3,5,[4,6]]],Demand.kr(Impulse.kr(1/3),0,Dseq([9,8,6,4],inf))*7).floor,LFPar.ar(1,2,911,999))/3}.play; 

---
play{VarSaw.ar((Hasher.ar(Latch.ar(SinOsc.ar((1..4)!2),Impulse.ar([5/2,5])))*300+300).round(60),0,LFNoise2.ar(2,1/3,1/2))/5} 

---
play{a=VarSaw.ar(SinOsc.ar(1/20,7/3,80,80),0,LFNoise1.kr(1,1/2,1/2))*Line.ar(0,1)!2;CombN.ar(a,2,2,20,1,a).softclip} 

---
4.do({{PanB2.ar(Gendy1.ar(1,1,1,1,rrand(150,250),500,0.1)*LFNoise1.kr(1,0.25,0.75),LFNoise1.kr(1))}.play}) 

---
play{BPF.ar(VarSaw.ar(LFNoise1.kr(3,40,200),0,0.25)+PinkNoise.ar(0.1),LFNoise2.kr(12,700,1000),0.3)!2}; 

---
play{LFCub.ar(LFSaw.kr(LFPulse.kr(1/4,1/4,1/4)*2+2,1,-20,50))+(WhiteNoise.ar(LFPulse.kr(4,0,LFPulse.kr(1,3/4)/4+0.05))/8)!2} 

---
play{x=Decay2.ar(Impulse.ar([4,3]))*Blip.ar(50,4)+LocalIn.ar(2);LocalOut.ar(DelayC.ar(x,2,TChoose.kr(Impulse.kr(1/4),[3,4,6]/8).lag));x} 

---
play{x=LFNoise1.kr(1/4,7,8);GVerb.ar(Decay2.ar(Impulse.ar([x,x+1]),x/2e3,x/50)*Blip.ar(x*3+50,x*2),2,60)}  

---
{CombC.ar(Decay2.ar(Impulse.ar(1))*SinOsc.ar(800)*0.1,4,LFNoise2.ar(LFNoise1.kr(0.1).range(0.1,2)).range(0.01,3),10)!2}.play 

---
(play{GVerb.ar([Impulse.ar([8,3]),Dust.ar([3,8])],roomsize:LFNoise2.kr(1/4)*28+[1.5,2])};) 

---
(play{v=PulseCount.ar(Impulse.ar(8e3));HPF.ar((((v*6)&amp;(v&lt;&lt;[14,13]))|((v*3)%(v&gt;&gt;[17,18])))%[51,53]%8,5).tanh;})  

---
(a={|z=#[0,1]|var i=LFTri.ar([4,3]*77)*Decay2.kr(Impulse.kr([5,3]/6),2,1);i+BufDelayL.ar(z/9,i*8,7*Saw.ar(8/7))}.play;) 

---
play{a=LFTri.ar(b=8/(1..11))%(LFTri.ar(b-3))+2.01;Limiter.ar(Splay.ar(Formant.ar(202*a[0..3],404*a[4..7],606*a[8..11])))/2} 

---
play{Splay.ar(Limiter.ar(Formlet.ar((a=LFSaw).ar((b=(1..8))+200),b*a.ar(b/29).round(0.51)+1*99,a.ar(b/9)*0.5+0.50001)/99))} 

---
Ndef(\,{|g,f|LPF.ar(Saw.ar([g,f]),1999)}).play;{|i|Ndef(\)[i+1]=\set-&gt;Pbind(\lag,i/9.1,\g,a=Pseq((i..9)*91,inf),\f,a-i)}!19 

---
Ndef(\,{|g,f|Pulse.ar([g,f])}).play;{|i|Ndef(\)[i=i+1]=\set-&gt;Pbind(\lag,i,\g,Pseq((i..9)*99,inf),\f,Pseq((i..91)*9,inf))}!9 

---
play{a=LFTri;b=(1..11).rotate(4)*1.011;LeakDC.ar(Splay.ar(Sweep.ar(0,b+999).fold(a.ar(11.11/b)/2-0.5,a.ar(11.1/b)/2+0.5)))} 

---
play{a=LFSaw;c=(1..32);Splay.ar(SinOsc.ar(0,BPF.ar(a.ar(pi/c)*8pi*a.ar(c*a.ar(2/c,1/c,8.16,16)),c*99,a.ar(3/c)/3+0.34))/2)} 

---
play{a=SinOsc;f={|i|Vibrato.ar(*if(i&gt;0,{[a.ar(1/i)+2*f.(i-1)]},{[(99..96),(1..4),a.ar(0.1)+1,9]}))};Splay.ar(a.ar(f.(10)))} 

---
play{c=SinOsc;mean({|i|Splay.ar({|j|CombC.ar(c.ar(j+1*99),1,c.ar(a=i*2+j/12)/2+0.5)*c.ar(i+j*99+99)*c.ar(a/3)}!8)}!8).tanh} 

---
play{c=LFTri;mean({|i|Splay.ar([a=Saw.ar(i/98+99),DelayC.ar(a,2,c.ar(i/97+c.ar(i+1/(c.ar(i/96)*2e3+2e3),i/9,9))+1),a])}!9)} 

---
play{Splay.ar(Formant.ar(RLPF.ar(Blip.ar(b=[4,0.5,8,16],LFSaw.ar(1/b,0,c=99,c),c,64),c,SinOsc.ar(b,b,0.5,0.6)).midicps,c))} 

---
play{a=SinOsc;GVerb.ar(a.ar(1+round(a.ar(0.01),c=[1,2]/3)*99*round(a.ar(c/2)+2))*a.ar(a.ar(c))*a.ar(c/4,0,a.ar(1/c)),99)/4} 

---
play{a=LFTri;b=(1..5);Splay.ar(a.ar(b*99+round(a.ar(2/b)*40,40),b,a.ar(a.ar(0.5/b),b,a.ar(1/b,b,a.ar(2**b,b,pi)))).asin)/2} 

---
play{a=LFTri;b=(1..8)+0.505;Splay.ar(a.ar(a.ar(1/(101-b))+1*99|a.ar(a.ar(1/b,1/b,pi,a.ar(1/b)+9)/b,1/b,404,404))*3).tanh/2} 

---
{|i|SynthDef(i,{|f|Out.ar(i,Saw.ar(f)*EnvGate())},0.123456).add;Pmono(i,\dur,c=Pn(Pshuf(i*4+4/8.fib,8))/20,\f,15/c).play}!2 

---
SynthDef(\,{|f|Out.ar(0,LFPar.ar(f)*EnvGate()!2)}).add;PmonoArtic(\,\legato,c=Pn(Pshuf(6/8.fib,8)),\dur,c/22,\f,400/c).play 

---
a=LFPar;play{Out.ar(5,a.ar(1)|a.ar(5)+RLPF.ar(x=Pan2.ar(InFeedback.ar(5),SinOsc.ar(5.5)),3e3,a.ar(1/25)/2+1.7));x*a.ar(99)} 

---
a=LFTri;Ndef(\a,{CombC.ar(Ndef(\).ar,1,a.ar(2)/8+0.2,6)+9&amp;(a.ar(1/3)*6+5)});Ndef(\,{LPF.ar(a.ar(Ndef(\a).ar*99),3e3)}).play 

---
a=LFTri;Ndef(\a,{CombC.ar(Ndef(\).ar,1,a.ar([2,3])/8+0.2,8)+8&amp;(a.ar(1/[3,2])*7)});Ndef(\,{a.ar(Ndef(\a).ar*[99,199])}).play 

---
play{a=LFCub;b=(1..8);sum(CombN.ar(SinOsc.ar(c=2/b,a.ar(ceil(a.ar(c)*a.ar(1/b,0,75)).round(75),0,a.ar(0.1/c)*9)),1,1/5))/9} 

---
play{b=(1..4);Splay.ar(CombN.ar(SinOsc.ar(1/b,Spring.ar(LFPulse.ar(pi/b),99*b,1.3e-3)*LFTri.ar(0.13/b,0,pi,2pi)),1,1/4,2))} 

---
play{a=SinOsc;c=a.ar(0,a.ar(b=[2,3])*400,a.ar(b/4.1));c+a.ar(b*99*Amplitude.ar(c,0,1/7))+GrayNoise.ar(CombN.ar(c,1,b/3))/2} 

---
play{GVerb.ar(Splay.ar(SinOsc.ar(0,Blip.ar(a=(1..5),99)*99,Blip.ar(a+2.5,a).lag2(LFSaw.ar(1/(a+2.25),2/a)+1)))/3,99,6,0.7)} 

---
30.do{|i|play{b=13.fib;Resonz.ar(Splay.ar(Blip.ar(i+1/b,19)*ClipNoise.ar),i*[50,60]+400,LFTri.ar(1/[20,30]*i,i/9)/9+0.13)}} 

---
play{a=LFTri;Splay.ar(Pulse.ar(b=(101,202..1010)/2,RHPF.ar(a.ar(99/b)*0.9%1,a.ar(9/b,b).linexp(0,1,4,1e4),a.ar(5/b)+1.5)))} 

---
play{a=LFTri;BufWr.ar(a.ar(b=[303,404]),l=LocalBuf(64,2).clear,a.ar(b*a.ar(99/b)));BufRd.ar(2,l,a.ar(b+2)*a.ar(0.01)*12)/4} 

---
play{CombC.ar(BLowPass.ar(Limiter.ar(LeakDC.ar(InFeedback.ar([1,0]))),2e3)+Impulse.ar(0),1,LFTri.ar(1/[6,8])*0.4+0.5)*0.99} 

---
play{a=SinOsc;LeakDC.ar(a.ar([1,2],a.ar(Pitch.kr(CombN.ar(InFeedback.ar([1,0]),5,[4.8,4.7])).flop[0]-4)*2pi*a.ar(1/16)))/2} 

---
play{a=LFPulse;a.ar(Pitch.kr(CombN.ar(InFeedback.ar([1,0]),4,4,8)).flop[0]*a.ar([6,3],0,a.ar(1.99)/8+0.3,1.2),0,a.ar(1)/2)} 

---
play{a=SinOscFB;a.ar(Pitch.kr(CombN.kr(InFeedback.ar([1,0]),1,1/[2,3])).flop[0]*a.ar(1/[3,4],0.1,0.3,1.2),a.ar(1/[4,5])/2)} 

---
play{c=CombN.ar(InFeedback.ar(0,2),1,1/8,2.4,1.4);LeakDC.ar(SinOscFB.ar(Pitch.kr(c).flop[0]-0.2+(d=c.abs.lag(0.032)),1-d))} 

---
play{a=SinOscFB;c=a.ar([50,99],0.4);RecordBuf.ar(InFeedback.ar(0,2)+c/3,b=LocalBuf(8e4,2).clear);BufRd.ar(2,b,a.ar(c)*6e4)} 

---
play{a=LFTri;BufWr.ar(a.ar([2.995,4]*99),b=LocalBuf(3e4,2).clear,a.ar([2,6]/99)*3e4);BufRd.ar(2,b,a.ar([6,9.06]/99)*9e3)/5} 

---
{|i|Pmono(\default,\dur,Pseq(1/[i=i+0.999,Pn(Pseq(b=(2..8)*i),Pseq(b))],inf),\amp,1/b,\freq,Pseq([b,b*i/4]*99,inf)).play}!8 

---
a=SinOscFB;play{LeakDC.ar(Splay.ar(RHPF.ar(PinkNoise.ar(a.ar(b=1/(1..32),b)),a.ar(a.ar(b,b),1.35)+1/b*50,0.009,b))).tanh/2} 

---
{play{Ringz.ar(Crackle.ar.tanh,2000.exprand(20),{0.6.rand}!2)/800*Decay.ar(TDuty.ar(Dseq([Dshuf((0,1..5)/6,3)],inf)))}}!11 

---
play{a=Pulse;(40..61).midicps.clump(2).collect{|x,y|RHPF.ar(a.ar(x+Decay.ar(Impulse.ar(7/(y+3)),1/(y+2),x*4))/12,y*100+40,0.02)}.sum.tanh} 

---
play{GVerb.ar({|i|RLPF.ar(Saw.ar(1e3/(i+3),Decay.ar(Impulse.ar(1/(i+1),0.5),1)),500*i+1e3,0.4)}.dup(10).sum*0.2,77)}  

---
play{d=Duty.kr(Dwhite(0,LFNoise2.ar([1,1]).abs,inf),0,Dwhite(0,230,inf));GVerb.ar(BPF.ar(PinkNoise.ar(39),d.midicps,0.005).softclip,2,0.05)} 

---
play{b=GVerb.ar(Blip.ar(Duty.ar(1,0,Dseq([9,0,4,7,[12,5],16]+51,inf)).midicps,LFNoise0.kr(3,11)),200);3.do({|i|b=DelayC.ar(b*0.2,3,i)+b});b} 

---
Ndef(\p,{n=Ndef.ar(\p);Limiter.ar(AllpassN.ar(SyncSaw.ar(n,(Pitch.kr(n,3,3)[0]*2-88200).dup%88200).trunc(0.5**4),1,1/[3.25,3.35],13))}).play 

---
play{f=Duty.ar([0.1,0.09],0,Dseq([0,5,4,7,Drand([12,8,10,11,4])]+72,inf)).midicps*[0.5,1];GVerb.ar(SyncSaw.ar(f,[f[1],f[0]*4])*0.1,300,1)} 

---
play{SyncSaw.ar([3,4],Duty.ar(1/Dstutter(60,Dwhite(5,159)),0,Dseries(0,Dstutter(60,Dwhite(-330,9)/300))%1).linexp(0,1,20,3000)).trunc(0.25)} 

---
play{p=Impulse.ar(2,[1/3,0]);d=Demand.ar(p,0,Dseq([0,4,7,4,1,4,7,4,2,5,7,5,2,5,7,5],inf)).midicps*16;Pluck.ar(PinkNoise.ar,p,1,1/d,3).sum} 

---
play{{|i|r=LFNoise2.ar(0.3,0.5,0.5);n=DelayC.ar(In.ar(i*r),1,i);Out.ar(i*r,Ringz.ar(n+Impulse.ar(),Pitch.kr(n)[0]*i,200).softclip)}!30} 

---
play{b=LocalBuf(8192,4);d=Dust.kr(9)+Dust2.kr([4,4]);r=PlayBuf.ar(2,b,TExpRand.kr(0.01,19,d),d,0,1)/4;f=FFT(b,d+(d*r));r.clip2(1)} 

---
{|i|Pbind(\instrument,play{|freq|LFNoise0.ar([freq,freq])/2}.defName,\legato,0.35,\scale,(1..9),\degree,Pbrown(0,79,8),\dur,i+1/9).play}!8 

---
b=Buffer.alloc(s,44100,1,{|u|u.chebyMsg(Array.fill(1028,{2.rand}))});play{Shaper.ar(b,Osc.ar(b,0.004*Stepper.ar(Pulse.ar([4,3]),0,0,9)))} 

---
play{GVerb.ar(TGrains.ar(2,Pulse.ar(3),Buffer.read(s,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)),x,Sweep.ar(x)))} 

---
play{a=SinOsc;Formlet.ar(a.ar(Convolution.ar(b=GbmanN.ar(Stepper.ar(a.ar(5))),b)),a.ar(Sweep.ar(a.ar(1/9),2)).range(1e3,4e3),0.01,1/99)!2} 

---
play{a=SinOsc.ar(_);f=Stepper.ar(LFPulse.ar(53+(329*a.(Duty.ar(1,0,Dseq([5,5,5,7],inf))))));a.(334/f).tanh!2} 

---
play{a=LFCub;GVerb.ar(Formlet.ar(a.ar(Convolution.ar(b=LinCongN.ar(5),b)),a.ar(Sweep.ar(a.ar(1/9),3)).range(1999,3999),0.01,0.1))} 

---
m=[GrainSin,GrainFM];{|i|play{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(2,Saw.kr(9-i),t=9e-3,c=Convolution.ar(b.(4),b.(5))/4,c/t)),t,t)/9}}!2 

---
play{a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(10,1e-2)+a.ar(39*p.ar(1))+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(8),b)))!2/9} 

---
play{FreeVerb2.ar(RLPF.ar(a=Convolution.ar(StandardN.ar([1,2], 2),Gendy1.ar(4,1,1,1,20,999)),SinOsc.ar(999).range(9,1e4)),a)/222} 

---
play{FreeVerb2.ar(b=RLPF.ar(Klank.ar(`[(1..82)],Impulse.ar(1),0),SinOsc.ar(122).range(10,3300)),b)/99} 

---
fork{loop{http://t.co/0RA0Zf1b7G{|i|{SinOsc.ar(i.ascii)*EnvGen.ar(Env.perc,doneAction:2)!2}.play;i.post;1.wait;};"\r".post}}

---
ProxySpace.push;~a0.play;~a1.play;fork{loop{2.do{|i|currentEnvironment[(\a++i).asSymbol]={GVerb.ar(LFTri.ar(99+9.rand2),1,i)/2};0.2.wait}}} 

---
play{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(16,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1))} 

---
play{GVerb.ar(IFFT(PV_BrickWall(FFT(Buffer.alloc(s,1024),WhiteNoise.ar*Pulse.ar(8,2e-2)),SinOsc.ar(Duty.kr(1,0,Dseq((10..19),inf))))))} 

---
play{p=Pulse;WhiteNoise.ar*p.ar(8,h=3e-3)+GVerb.ar(GrainSin.ar(2,p.ar(8),n=h*t=LFNoise0.ar,1/n),2)+PMOsc.ar(9*p.ar(4*t),111,p.kr(6,t,1,1))} 

---
play{a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(8,0.01)+a.ar(98*n=p.ar(4),0,p.kr(2,add:1))+GVerb.ar(a.ar(99*n)+p.ar(p.kr(3*n)),1,mul:0.1)} 

---
play{p=Pulse;GVerb.ar(IFFT(PV_BrickWall(FFT(Buffer.alloc(s,128),WhiteNoise.ar*p.ar(8,5e-4)+SinOsc.ar(9*p.ar(1),0,n=p.kr(p.ar(5)))),n)))} 

---
2.do{|i|SynthDef(\++i,{|f|a=[PinkNoise,LFCub];Out.ar(0,a[i].ar(f)*Line.ar(1,0,k=1/6))}).add;Pbind(\instrument,\++i,\f,80*i+k,\dur,i+k).play} 

---
play{a=Dust.kr(1/(10..20));g=60;f=(a*g+g).round.midicps;b=GrainFM.ar(2,a,2,g,f*2.87,3,a*2-1)*0.05;c=b.sum;c+GVerb.ar(c.sum,100,30)} 

---
{n=LFNoise0;GVerb.ar(GrainSin.ar(1,Dust.kr([1,2]),n.kr(10,0.001,0.002),n.kr(1,1e3,SinOsc.kr([0.01,0.02],0,1e4,1e4)))*0.2,200,300).sum}.play; 

---
{Splay.ar(Saw.ar(EnvGen.ar(Env([60,40,43],[0.2,0.2]))*[2,3,4,5,7,9]))*EnvGen.ar(Env.perc)*0.2}.play   

---
play{o=LFSaw.ar([0.4,0.3]);x=GVerb.ar(LFSaw.ar(60)*EnvGen.ar(Env.perc(0,0.1),[o&gt;0,o&lt;0]),5,5)*0.08;CombC.ar(x,0.2,[0.02,0.015],15,1,x)/2;} 

---
{CombC.ar(Decay.ar(Dust.ar(1,0.5),0.2,WhiteNoise.ar),0.2,0.2,3)*MouseButton.kr(0,5)}.play; 

---
play{BPF.ar(Saw.ar(328,0.7),[Line.ar(5000,1,5),XLine.ar(1,5000,5)],0.7)*EnvGen.kr(Env.perc(0.6,10,1),1,doneAction:2)} 

---
p=Pulse;o=SinOsc;{DynKlank.ar(`[{4.0.rrand(6)*100}!9*o.kr(1/270,pi.rand,0,100),b,1!9],p.ar(450,p.ar(o.ar(0.01,0,55,412)),2))!2}.play 

---
{a=BufDelayL.ar(b=Buffer.read(s,Platform.resourceDir+/+"sounds/a11wlk01.wav"),(GVerb.ar(PlayBuf.ar(1,b,loop:1))*SinOsc.ar).tanh,10)}.play 

---
play{b=SinOsc;c=LFNoise0;d=AllpassC;e=0.2;d.ar(d.ar(b.ar(c.kr(2).range(220,440),c.kr,e),e*10,b.kr(e).range(e,e*9),10))}!3 

---
fork{6.do{Pbind(\dur,0.125,\sustain,1.2.rand,\strum,2.rand/4,\degree,Pn(Plazy({Pshuf({9.rand}!4,4).clump(4.rand+1)}))).play;4.wait}} 

---
play{d=Demand;i=Impulse;Decay.ar(t=i.ar(8))*Saw.ar(2**(d.ar(t,0,Drand(d.ar(i.ar(1),0,Dseq([0,9,5]!6+[12,5,0],inf)),inf))/12)*120!2)} 

---
{Integrator.ar(LFSaw.ar(5),LFSaw.ar(2086),Line.ar(48,86))}.play  
