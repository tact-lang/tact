struct Inner {
  a: Int;
}

contract Test31 {
  val1: Inner?;
  val2: Inner?;

  init() {
    self.val1 = null;
    self.val2 = null;
  }
}