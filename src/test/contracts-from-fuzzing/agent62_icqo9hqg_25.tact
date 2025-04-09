contract ManyScalarTypes {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
  g: Address;
  h: Address?;
  i: Cell;
  j: Slice;

  init() {
    self.a=1; self.b=null; self.c=true; self.d=null;
    self.e="hello"; self.f=null; self.g=myAddress(); self.h=null;
    self.i=emptyCell(); self.j=emptyCell().asSlice();
  }
}