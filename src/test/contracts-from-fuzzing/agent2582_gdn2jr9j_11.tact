struct NestedOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract Test {
  val: NestedOpt;

  init() {
    self.val = NestedOpt{
      a: null,
      b: null,
      c: null,
    };
  }
}
