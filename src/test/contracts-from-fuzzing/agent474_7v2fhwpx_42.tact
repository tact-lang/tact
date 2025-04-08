// Mix default and optional assignments
contract Mix {
  a: Int = 4;
  b: Bool? = null;
  c: String = "bar";
  d: String? = null;

  init() {
    self.a = 7;
    self.b = true;
    self.c = "baz";
    self.d = null;
  }
}
