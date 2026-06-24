contract ChainedNested {
  a: Int;
  b: Bool;
  c: String;

  init() {
    self.a = 1;
    self.b = false;
    self.c = "start";
  }

  receive() {
    self.a = self.a + 1;
    self.b = !self.b;
    self.c = ""; // workaround for no string concat
  }
}