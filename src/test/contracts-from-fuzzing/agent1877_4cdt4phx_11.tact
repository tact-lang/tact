struct Defaulted {
  a: Int = 1;
  b: String = "hello";
  c: Bool = true;
}

contract DefaultsTest {
  val: Defaulted;

  init() {
    self.val = Defaulted{};
  }
}
