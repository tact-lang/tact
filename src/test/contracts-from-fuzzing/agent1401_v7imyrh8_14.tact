struct StructWithDefaults {
  a: Int = 42;
  b: Bool = false;
  c: String = "test";
}

contract DefaultsInStruct {
  val: StructWithDefaults;

  init() {
    self.val = StructWithDefaults{};
  }
}