struct DefaultsOptional {
  a: Int = 42;
  b: Bool?;
  c: String = "hi";
}

contract DefaultOptionalStruct {
  data: DefaultsOptional;

  init() {
    self.data = DefaultsOptional{};
  }
}