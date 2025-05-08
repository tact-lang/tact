contract DefaultInitializers {
  a: Int = 42;
  b: Bool = true;
  c: String = "hello";
  d: Int? = null;
  e: Bool? = null;
  f: String? = null;

  init() {
    self.a = 1;
    self.b = false;
    self.c = "bye";
    self.d = null;
    self.e = null;
    self.f = null;
  }
}