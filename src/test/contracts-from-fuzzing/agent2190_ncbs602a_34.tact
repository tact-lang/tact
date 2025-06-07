contract BigMix {
  a: Bool;
  b: Int;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Int?;
  h: String?;
  i: Bool?;
  j: Address?;

  init() {
    self.a=true; self.b=1; self.c="ok"; self.d=myAddress(); self.e=emptyCell(); self.f=emptyCell().asSlice();
    self.g=null; self.h=null; self.i=null; self.j=null;
  }
}