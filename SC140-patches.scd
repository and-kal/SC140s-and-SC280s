play{Pan2.ar(FreqShift.ar(Impulse.ar(200,0,60),SinOsc.kr(0.125+LFNoise0.kr(1,0.4,0.5),0,6000),0,Impulse.kr(8,0,0.4)))};

play{Pan2.ar(Mix.fill(10, {|i| PulseDPW.ar(([rrand(15,500),rrand(500,15)]*(i**(9/8))),0.5,Saw.kr(LFNoise2.kr(1/4,0.5,1),0.1))}))};
