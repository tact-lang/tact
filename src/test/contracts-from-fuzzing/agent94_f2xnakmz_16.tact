struct HasDefaults {
  a: Int = 100;
  b: Bool = true;
  c: String = "test";
}

contract DefaultStruct {
  data: HasDefaults;

  init() {
    self.data = HasDefaults{};
  }
}