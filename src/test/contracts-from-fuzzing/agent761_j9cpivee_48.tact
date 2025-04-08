contract OptionalOrder {
  a: Int?;
  b: Bool;
  c: Bool?;
  d: Int;

  init() {
    self.a = null;
    self.b = false;
    self.c = true;
    self.d = 1;
  }
}