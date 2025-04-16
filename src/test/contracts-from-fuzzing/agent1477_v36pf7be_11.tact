struct Defaulted {
  id: Int = 3;
  name: String = "hello";
  flag: Bool = true;
}

contract StructDefaults {
  d: Defaulted;

  init() {
    self.d = Defaulted{};
  }
}