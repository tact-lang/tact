struct NestedOptional {
  inner: Int?;
}

contract NestedOptContract {
  val: NestedOptional?;

  init() {
    self.val = null;
  }
}