struct NestedOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptNested {
  val: NestedOpt;

  init() {
    self.val = NestedOpt{
      a: null,
      b: null,
      c: null
    };
  }
}