struct Inner {
  a: Int;
  b: Bool;
}

contract NestedOptionals {
  val: Inner?;

  init() {
    self.val = null;
  }
}