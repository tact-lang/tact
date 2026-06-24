contract OptionalDefaults {
  x: Int? = null;
  y: Bool? = true;
  s: String? = null;
  a: Address? = null;
  c: Cell? = null;

  init() {
    self.x = 1;
    self.y = false;
    self.s = "abc";
    self.a = myAddress();
    self.c = emptyCell();
  }
}
