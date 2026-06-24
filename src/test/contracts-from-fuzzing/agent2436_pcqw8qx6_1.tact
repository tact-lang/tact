struct NestedOpt {
  val: Int?;
}

contract Test {
  field: NestedOpt;

  init() {
    self.field = NestedOpt{val: null};
  }
}