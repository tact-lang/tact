// contract with >20 persistent fields of mixed kinds
contract BigStorage {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int;
  h: Bool;
  i: String;
  j: Int?;
  k: Bool?;
  l: String?;
  m: Int;
  n: Bool;
  o: String;
  p: Int?;
  q: Bool?;
  r: String?;
  s: Int;
  t: Bool;
  u: String;

  init() {
    self.a=1; self.b=true; self.c="a";
    self.d=2; self.e=false; self.f=null;
    self.g=3; self.h=false; self.i="b";
    self.j=null; self.k=true; self.l="c";
    self.m=4; self.n=true; self.o="d";
    self.p=5; self.q=null; self.r=null;
    self.s=6; self.t=false; self.u="e";
  }
}