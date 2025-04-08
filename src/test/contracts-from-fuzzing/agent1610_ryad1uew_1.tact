struct NestedInner {
  x: Int;
  y: Int;
}

struct NestedOuter {
  inner: NestedInner;
  z: Int;
}

contract TestNestedStruct {
  data: NestedOuter;

  init() {
    self.data = NestedOuter{
      inner: NestedInner{
        x: 1,
        y: 2,
      },
      z: 3,
    };
  }
}