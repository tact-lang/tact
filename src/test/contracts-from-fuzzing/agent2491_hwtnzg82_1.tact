struct Inner {
  val: Int;
}

contract TestContract {
  nested: Inner;

  init() {
    self.nested = Inner{val: 5};
  }
}