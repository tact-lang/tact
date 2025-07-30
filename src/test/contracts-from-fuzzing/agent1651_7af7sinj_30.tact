contract OptionalConfusing {
  a: Int? = null;
  b: Bool? = true;
  c: String? = null;

  init() {
    self.a = 42;
    self.b = false;
    self.c = "tact";
  }
}