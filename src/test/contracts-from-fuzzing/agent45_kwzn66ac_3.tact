struct OptInner {
  x: Int?;
  y: Bool?;
}

struct OptOuter {
  k: Int;
  m: OptInner?;
}

contract OptDeep {
  p: OptOuter;

  init() {
    self.p = OptOuter {
      k: 10,
      m: OptInner {
        x: null,
        y: true
      }
    };
  }
}