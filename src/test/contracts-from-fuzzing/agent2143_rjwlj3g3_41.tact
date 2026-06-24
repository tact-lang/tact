contract HugePrimitives {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: Int;
  h: Bool;
  i: String;
  j: Address;
  k: Cell;
  l: Slice;

  init() {
    self.a=1; self.b=true; self.c="c"; self.d=emptyCell(); self.e=emptyCell().asSlice(); self.f=myAddress();
    self.g=2; self.h=false; self.i="s"; self.j=myAddress(); self.k=emptyCell(); self.l=emptyCell().asSlice();
  }
}