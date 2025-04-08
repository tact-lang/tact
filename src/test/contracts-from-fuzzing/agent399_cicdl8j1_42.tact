struct ManyDefaults {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  s: String = "text";
  bval: Bool = true;
}

contract ManyDefaultsStruct {
  x: ManyDefaults;

  init() {
    self.x = ManyDefaults{};
  }
}