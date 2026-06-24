struct InnerMost {
  z: Int;
}

struct MiddleLayer {
  mid: InnerMost;
}

struct OuterLayer {
  out: MiddleLayer;
}

contract ThreeLayer {
  complex: OuterLayer;

  init() {
    self.complex = OuterLayer{
      out: MiddleLayer{
        mid: InnerMost{z: 999}
      }
    };
  }
}