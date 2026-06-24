contract OptContract {
  s: String?;
  a: Address?;
  c: Cell?;

  init() {
    self.s = "test";
    self.a = null;
    self.c = emptyCell();
  }
}