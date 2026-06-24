struct OptionalDeep {
  a: Int?;
  b: String?;
  c: Cell;
}

struct NestedWrap {
  optDeep: OptionalDeep?;
  num: Int;
}

contract OptNesting {
  nested: NestedWrap;

  init() {
    self.nested = NestedWrap{optDeep: null, num: 1};
  }
}
