struct NestedEmpty {
  inner: Int?;
}

contract NestedEmptyStruct {
  val: NestedEmpty;

  init() {
    self.val = NestedEmpty{ inner: null };
  }
}