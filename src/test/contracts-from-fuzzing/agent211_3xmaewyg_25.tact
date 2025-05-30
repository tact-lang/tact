struct DefaultsTest {
  a: Int = 1;
  b: Bool = false;
  c: String = "def";
  d: Address;
}

contract DefaultValuesTest {
  data: DefaultsTest;

  init() {
    self.data = DefaultsTest{
      d: myAddress()
    };
  }
}
