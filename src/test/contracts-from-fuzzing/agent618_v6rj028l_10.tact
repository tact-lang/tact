struct DefaultVals {
  a: Int = 10;
  b: Bool = true;
  c: String = "hello";
  d: Bool?;  // default null
}

contract DefaultsTest {
  data: DefaultVals;

  init() {
    self.data = DefaultVals{};
  }
}
