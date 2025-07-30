struct InnerMost {
  z: Int;
}

struct Middle {
  y: InnerMost;
}

struct Outer {
  x: Middle;
}

contract DeepNestedStruct {
  value: Outer;

  init() {
    self.value = Outer{ x: Middle{ y: InnerMost{ z: 42 } } };
  }
}
