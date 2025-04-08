struct InnerManyNulls {
  a: Int? = null;
  b: Int? = null;
  c: Bool? = null;
  d: String? = null;
}

contract OptStructDefaults {
  s: InnerManyNulls? = null;

  init() {
    self.s = null;
  }
}