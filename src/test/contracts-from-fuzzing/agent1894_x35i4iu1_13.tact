struct StructWithDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "x";
  d: Int? = null;
  e: Bool? = null;
  f: String? = null;
}

contract StructDefaults {
  s: StructWithDefaults;

  init() {
    self.s = StructWithDefaults{};
  }
}