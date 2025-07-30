contract InitOverridesDefaults {
  a: Int = 1;
  b: Bool = true;

  init() {
    self.a = 42;
    self.b = false;
  }
}