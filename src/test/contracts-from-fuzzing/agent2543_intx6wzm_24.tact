struct MultipleDefaults {
  a: Int = 5;
  b: Bool = true;
  c: String = "hi";
  d: Int?;
}

contract DefVals {
  data: MultipleDefaults;
  init() {
    self.data = MultipleDefaults{};
  }
}