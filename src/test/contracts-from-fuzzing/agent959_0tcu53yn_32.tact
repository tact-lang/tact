struct ManyDefaults {
  a: Int = 1;
  b: String = "b";
  c: Bool = false;
  d: Int? = null;
  e: String? = null;
  f: Bool? = true;
}

contract StructManyDefaults {
  rec: ManyDefaults;
  init() {
    self.rec = ManyDefaults{};
  }
}