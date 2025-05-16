struct InnerMost {
  z: Int;
}

struct Inner {
  y: Int?; 
  nested: InnerMost;
}

contract DeepNestedOptionalTest {
  point: Inner;

  init() {
    self.point = Inner {
      y: null,
      nested: InnerMost { z: 123 }
    };
  }
}