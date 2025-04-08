struct SWithDefaults {
  count: Int = 0;
  message: String = "default";
  flag: Bool = true;
}

contract DefaultValStruct {
  s: SWithDefaults;
  init() {
    self.s = SWithDefaults{};
  }
}
