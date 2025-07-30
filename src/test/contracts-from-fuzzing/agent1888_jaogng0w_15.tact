contract ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Address?;
  f: Int?;
  g: Bool?;
  h: String?;
  i: Cell?;
  j: Address?;

  init() {
    self.a=null; self.b=true; self.c=null; self.d=emptyCell(); self.e=null;
    self.f=42; self.g=false; self.h="hey"; self.i=null; self.j=myAddress();
  }
}
