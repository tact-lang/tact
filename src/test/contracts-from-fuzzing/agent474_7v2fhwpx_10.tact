struct InnerMost {
  z: Int;
}

struct InnerMid {
  y: InnerMost;
}

struct Inner {
  x: InnerMid;
}

contract Test {
  nested: Inner;
  init() {
    self.nested = Inner{
      x: InnerMid{
        y: InnerMost{
          z: 555
        }
      }
    };
  }
}
