contract NestedDifferentTypes {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Address?;
  k: Cell?;
  l: Slice?;
  
  init() {
    self.a=1; self.b=true; self.c="abc"; self.d=myAddress();
    self.e=emptyCell(); self.f=emptyCell().asSlice();
    self.g=null; self.h=null; self.i=null; self.j=null; self.k=null; self.l=null;
  }
}