struct Inner {
  a: Int;
  b: Bool;
}

contract TestContract {
  val: Inner;
  init() {
    self.val = Inner{a: 1, b: true};
  }
}