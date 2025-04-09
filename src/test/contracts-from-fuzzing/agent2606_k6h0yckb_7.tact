struct Defaults {
  a: Int = 5;
  b: Bool = false;
  c: String = "def";
}

contract DefaultsTest {
  val: Defaults;

  init() {
    self.val = Defaults{};
  }
}