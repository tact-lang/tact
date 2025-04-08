struct Inner {
  a: Int;
  b: Bool;
}

contract TestContract {
  val1: Int;
  val2: Bool;
  nested: Inner;
  optVal: Int?;

  init() {
    self.val1 = 1;
    self.val2 = true;
    self.nested = Inner{ a: 2, b: false };
    self.optVal = null;
  }
}
