struct OptNested2 {
  a: Int?;
  b: Bool?;
}

struct OptNestedWrap {
  inner: OptNested2?;
}

contract OptNestedWrapAssignNull {
  data: OptNestedWrap;

  init() {
    self.data = OptNestedWrap{
      inner: null
    };
  }
}
