contract OptionalDefaultsContract {
  a: Int? = null;
  b: String? = null;
  c: Bool? = null;

  init() {
    self.a = 1;
    self.b = "abc";
    self.c = true;
  }
}