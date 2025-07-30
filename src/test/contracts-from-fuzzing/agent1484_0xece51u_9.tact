contract DefaultValues {
  a: Int = 5;
  b: Bool = true;
  c: String = "hi";
  d: Int? = null;
  e: Bool? = null;

  init() {
    self.a = 10;
    self.b = false;
    self.c = "bye";
    self.d = 42;
    self.e = true;
  }
}