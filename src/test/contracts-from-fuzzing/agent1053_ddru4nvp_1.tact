struct NestedInner {
  x: Int;
  y: Int?;
}

struct NestedOuter {
  ni: NestedInner;
  z: Int;
}

contract TestContract {
  data: NestedOuter;

  init() {
    self.data = NestedOuter{
      ni: NestedInner{
        x: 1,
        y: 2,
      },
      z: 3,
    };
  }
}