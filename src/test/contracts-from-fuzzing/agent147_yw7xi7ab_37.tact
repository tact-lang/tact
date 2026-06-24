contract ComboPrims {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Slice;
  f: Cell;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Address?;
  k: Slice?;
  l: Cell?;

  init() {
    self.a=1; self.b=true; self.c="hi"; self.d=myAddress(); self.e=emptyCell().asSlice(); self.f=emptyCell();
    self.g=null; self.h=null; self.i=null; self.j=null; self.k=null; self.l=null;
  }
}