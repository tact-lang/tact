struct SOptionalDefaults {
  a: Int = 1;
  b: Int? = null;
  c: Bool? = null;
  d: String? = null;
}

contract DefaultsOptStruct {
  data: SOptionalDefaults;

  init() {
    self.data = SOptionalDefaults{};
  }
}