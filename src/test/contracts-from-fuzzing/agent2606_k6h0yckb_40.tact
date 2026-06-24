struct Inner {
  opt: Int?;
}

contract NestedOptAssign {
  val: Inner;

  init() {
    self.val = Inner{ opt: null };
  }
}