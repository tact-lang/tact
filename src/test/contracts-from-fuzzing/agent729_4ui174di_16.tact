contract DefaultMix {
  x: Int = 10;
  y: String = "abc";
  o: Int? = null;
  b: Bool = true;

  init() {
    self.x = 20;
    self.y = "def";
    self.o = null;
    self.b = false;
  }
}
