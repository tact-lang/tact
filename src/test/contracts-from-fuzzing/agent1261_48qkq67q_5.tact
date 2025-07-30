contract ManyPrimitives {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Address;
  h: Cell;

  init() {
    self.a = 1;
    self.b = false;
    self.c = "abc";
    self.d = null;
    self.e = null;
    self.f = null;
    self.g = myAddress();
    self.h = emptyCell();
  }
}