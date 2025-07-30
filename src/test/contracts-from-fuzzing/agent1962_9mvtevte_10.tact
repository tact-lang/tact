contract LargeOptional {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Address?;
  e: Cell?;
  f: Slice?;

  init() {
    self.a = 3;
    self.b = "abc";
    self.c = true;
    self.d = myAddress();
    self.e = emptyCell();
    self.f = emptyCell().asSlice();
  }
}
