struct Defaulted {
  val1: Int = 5;
  val2: Bool = true;
  val3: String = "hello";
}

contract DefaultsTest {
  d: Defaulted;
  init() {
    self.d = Defaulted{};
  }
}
