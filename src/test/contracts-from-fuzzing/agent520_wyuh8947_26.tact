// optional primitive fields with explicit non-null default value (should work)
contract OptionalExplicitDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
  }
}