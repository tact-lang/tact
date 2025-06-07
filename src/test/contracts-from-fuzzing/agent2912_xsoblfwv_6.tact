struct SDefault {
  a: Int = 42;
  b: String = "hello";
  c: Bool = false;
}

contract Defaults {
  val: SDefault;
  init() {
    self.val = SDefault{};
  }
}