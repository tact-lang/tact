struct DefaultsTestStruct {
  a: Int = 11;
  b: Bool = false;
  c: String = "abc";
}

contract DefaultsStructTest {
  s: DefaultsTestStruct;

  init() {
    self.s = DefaultsTestStruct{};
  }
}
