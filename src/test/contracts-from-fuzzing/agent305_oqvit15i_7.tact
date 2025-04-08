struct OptInner {
  a: Int?;
  b: Bool?;
}

struct OptOuter {
  x: OptInner?;
  y: Int;
}

contract NestedOptionals {
  o: OptOuter;

  init() {
    self.o = OptOuter{
      x: OptInner{ a: null, b: false },
      y: 7,
    };
  }
}