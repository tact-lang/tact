contract ManyFields {
  a: Int;
  b: Int;
  c: Int;
  d: Bool;
  e: String;
  f: Address;
  g: Slice;
  h: Cell;
  i: Bool?;
  j: Int?;
  k: String?;
  l: Address?;
  m: Slice?;
  n: Cell?;

  init() {
    self.a=1; self.b=2; self.c=3; self.d=true; self.e="x"; self.f=myAddress(); self.g=emptyCell().asSlice(); self.h=emptyCell();
    self.i=null; self.j=null; self.k=null; self.l=null; self.m=null; self.n=null;
  }
}
