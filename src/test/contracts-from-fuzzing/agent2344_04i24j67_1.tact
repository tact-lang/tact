struct NestedInner {
  a: Int;
  b: Bool;
}

struct ComplexNested {
  x: Int;
  y: NestedInner;
  z: Bool?;
}

contract TestNested {
  data: ComplexNested;

  init() {
    self.data = ComplexNested{
      x: 1,
      y: NestedInner{a: 2, b: true},
      z: null,
    };
  }
}