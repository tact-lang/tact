struct NestedDefaults {
  a: Int = 5;
  b: String = "hi";
}

contract HasDefaultsInStruct {
  val: NestedDefaults;

  init() {
    self.val = NestedDefaults{};
  }
}