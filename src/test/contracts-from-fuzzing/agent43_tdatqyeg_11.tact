struct InnerNested {
  a: Int?;
  b: Bool?;
}

struct MiddleNested {
  x: Int;
  inner: InnerNested?;
}

contract OptionalMiddle {
  data: MiddleNested;

  init() {
    self.data = MiddleNested{ x:5, inner:null };
  }
}