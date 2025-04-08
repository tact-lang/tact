struct ManyDefaults {
  a: Int = 1;
  b: Int = 2;
  c: Bool = false;
  d: Bool = true;
  e: String = "e";
  f: String = "f";
  g: Int? = null;
  h: String? = null;
}

contract DefaultsMany {
  vals: ManyDefaults;

  init() {
    self.vals = ManyDefaults{};
  }
}
