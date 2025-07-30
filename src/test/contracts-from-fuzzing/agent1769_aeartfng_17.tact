struct NestedDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "c";
  d: Int? = null;
  e: Bool? = null;
}

contract StructWithDefaults {
  val: NestedDefaults;

  init() {
    self.val = NestedDefaults{};
  }
}