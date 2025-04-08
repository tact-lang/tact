struct NestedOpt {
  inner: Int?;
}

struct ContainsNestedOpt {
  nested: NestedOpt?;
}

contract Test {
  val: ContainsNestedOpt;
  init() {
    self.val = ContainsNestedOpt{ nested: null };
  }
}