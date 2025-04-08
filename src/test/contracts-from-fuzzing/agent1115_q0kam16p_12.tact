// test contract with many optional fields as storage
contract TestOpt {
  a: Int?;
  b: Bool?;
  c: Int?;
  d: Bool?;

  init() {
    self.a = 10;
    self.b = null;
    self.c = null;
    self.d = true;
  }
}