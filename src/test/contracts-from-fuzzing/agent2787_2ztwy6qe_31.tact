// contract with over 20 simple fields + a couple optional + nested struct

struct N {
  x: Int; y: Int;
}

contract SuperWide {
  a: Int; b: Int;
  c: Int; d: Int;
  e: Int; f: Int;
  g: Int; h: Int;
  i: Int; j: Int;
  k: Int; l: Int;
  m: Int; n: Int;
  o: Int; p: Int;
  q: Int; r: Int;
  s: Int; t: Int;
  u: Int; v: Int;
  flag1: Bool?;
  flag2: Bool?;
  nested: N;

  init() {
    self.a=1;self.b=2;self.c=3;self.d=4;self.e=5;self.f=6;
    self.g=7;self.h=8;self.i=9;self.j=10;self.k=11;self.l=12;
    self.m=13;self.n=14;self.o=15;self.p=16;self.q=17;self.r=18;
    self.s=19;self.t=20;self.u=21;self.v=22;
    self.flag1 = null; self.flag2 = true;
    self.nested = N{x:5,y:7};
  }
}
