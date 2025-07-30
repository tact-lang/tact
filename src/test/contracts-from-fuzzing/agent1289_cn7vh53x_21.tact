contract ManyDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "abc";
  d: Int? = null;
  e: Bool? = null;
  f: String? = null;

  init() {
    self.a=2; self.b=false; self.c="def"; self.d=3; self.e=true; self.f="ghi";
  }
}
