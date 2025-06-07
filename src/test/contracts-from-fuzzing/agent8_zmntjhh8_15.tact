struct ManyDefaults {
  a: Int = 0;
  b: Bool = false;
  c: String = "";
  d: Int? = null;
  e: Bool? = null;
  f: String? = null;
}

contract FullDefaults {
  st: ManyDefaults;

  init() {
    self.st = ManyDefaults{};
  }
}