struct StructWithDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "hi";
  d: Int?;
  e: Bool?;
}

contract DefaultsTest {
  val: StructWithDefaults;

  init() {
    self.val = StructWithDefaults{};
  }
}
