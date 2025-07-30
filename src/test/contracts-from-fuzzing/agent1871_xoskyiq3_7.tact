struct Defaults {
  i: Int = 42;
  b: Bool = true;
  s: String = "hi";
}

contract DefaultStructTest {
  val: Defaults;

  init() {
    self.val = Defaults{};
  }
}