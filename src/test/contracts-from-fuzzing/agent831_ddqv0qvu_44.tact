struct NestedInit {
  inner: Int;
}

contract NestedAssign {
  val: NestedInit;

  init() {
    self.val = NestedInit{ inner: 42 };
    self.val.inner = self.val.inner + 1;
  }
}