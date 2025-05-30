contract Nullables {
  a: Bool?;
  b: String?;
  c: Slice?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
  }
}