struct Sub {
  a: Int;
  b: Bool?;
}

struct Base {
  x: Int?;
  y: Sub?;
}

contract NestedNullableSub {
  data: Base;
  init() {
    self.data = Base{
      x: null,
      y: null
    };
  }
}