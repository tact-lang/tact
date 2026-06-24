contract OptionalsInit {
  i: Int?;
  s: String?;
  c: Cell?;
  b: Bool?;

  init() {
    self.i = 5;
    self.s = null;
    self.c = emptyCell();
    self.b = true;
  }
}