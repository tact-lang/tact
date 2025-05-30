contract Test {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Bool?;
  e: Bool?;
  f: String?;
  g: Address?;
  h: Cell?;
  i: Slice?;
  j: String?;

  init() {
    self.a=null; self.b=null; self.c=null; self.d=null; self.e=null;
    self.f=null; self.g=null; self.h=null; self.i=null; self.j=null;
  }

  receive() {
    self.a=1; self.b=2; self.c=3; self.d=true; self.e=false;
    self.f="hi"; self.g=null; self.h=emptyCell(); self.i=emptyCell().asSlice(); self.j="bye";
  }
}
