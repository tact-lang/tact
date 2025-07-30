contract ManyOptionals {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Cell?;
  e: Slice?;

  init() {
    self.a = null;
    self.b = "hello";
    self.c = null;
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
  }
}