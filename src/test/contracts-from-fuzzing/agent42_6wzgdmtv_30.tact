// Optional with override
contract OptMixed {
  a: Int? = null;
  b: String?;

  init() {
    self.a = 42;
    self.b = null;
  }
}