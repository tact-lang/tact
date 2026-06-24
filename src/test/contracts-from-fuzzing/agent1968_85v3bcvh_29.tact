struct Inner {
  a: Int;
}

contract Test30 {
  val1: Inner;
  val2: Inner;

  init() {
    self.val1 = Inner{a:1};
    self.val2 = Inner{a:2};
  }
}