contract OptionalMix {
  a: Int?;
  b: Bool;
  c: String?;
  d: Cell;

  init() {
    self.a = null;
    self.b = false;
    self.c = "non-null";
    self.d = emptyCell();
  }
}