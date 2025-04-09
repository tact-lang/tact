struct Defaults {
  a: Int = 42;
  b: Bool = true;
  c: String = "hi";
}

contract DefsTest {
  val: Defaults;

  init() {
    self.val = Defaults{};
  }
}