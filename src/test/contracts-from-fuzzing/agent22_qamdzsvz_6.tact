struct StructWithDefaults {
  a: Int = 10;
  b: Int = 20;
  c: Bool = false;
}

contract TestWithDefaults {
  data: StructWithDefaults;

  init() {
    self.data = StructWithDefaults{};
  }
}