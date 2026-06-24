contract ManySimpleFields {
  a: Int;
  b: Int;
  c: Int;
  d: Bool;
  e: Bool;
  f: String;
  g: String;
  h: Address;
  i: Address;
  j: Cell;
  k: Cell;
  l: Slice;
  m: Slice;

  init() {
    self.a=1; self.b=2; self.c=3; self.d=true; self.e=false;
    self.f="f"; self.g="g"; self.h=myAddress(); self.i=myAddress();
    self.j=emptyCell(); self.k=emptyCell();
    self.l=emptyCell().asSlice(); self.m=emptyCell().asSlice();
  }
}