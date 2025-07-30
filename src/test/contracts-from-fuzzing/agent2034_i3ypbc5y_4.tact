contract LargeManyPrimitives {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
  e: Int;
  f: Int;
  g: Int;
  h: Int;
  i: Int;
  j: Int;
  k: Bool;
  l: Bool;
  m: Bool;
  n: Bool;
  o: Bool;
  p: Bool;
  q: Cell;
  r: Cell;
  s: Cell;
  t: Cell;
  u: Cell;
  v: Cell;
  w: Address;
  x: Address;
  y: Address;
  z: Address;

  init() {
    self.a = 1; self.b=2; self.c=3; self.d=4; self.e=5;
    self.f=6; self.g=7; self.h=8; self.i=9; self.j=10;
    self.k=true; self.l=false; self.m=true; self.n=false; self.o=true; self.p=false;
    self.q=emptyCell(); self.r=emptyCell(); self.s=emptyCell(); self.t=emptyCell(); self.u=emptyCell(); self.v=emptyCell();
    self.w=myAddress(); self.x=myAddress(); self.y=myAddress(); self.z=myAddress();
  }
}