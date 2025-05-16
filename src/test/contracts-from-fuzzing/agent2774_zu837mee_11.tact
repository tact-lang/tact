// test optional top-level persistent variables with default null
contract TestContract {
  a: Int?;
  b: Bool?;
  c: String?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
  }
}