contract ManyDefaults {
  a: Int = 5;
  b: Bool = false;
  c: String = "hello";
  d: Int? = null;
  e: Bool? = null;
  f: String? = null;

  init() {
    self.a = 55;
    self.b = true;
    self.c = "bye";
    self.d = 42;
    self.e = false;
    self.f = "not null";
  }
}