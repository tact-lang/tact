struct Defaulted {
  a: Int = 42;
  b: Bool = false;
  c: String = "hello";
}

contract TestContract {
  val: Defaulted;

  init() {
    self.val = Defaulted{};
  }
}