struct Defaulted {
  a: Int = 1;
  b: Bool = true;
  c: String = "abc";
  d: Int?; // null default implicitly
}

contract Defaults {
  val: Defaulted;

  init() {
    self.val = Defaulted{}; // use defaults
  }
}