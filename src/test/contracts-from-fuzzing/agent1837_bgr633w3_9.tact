struct OptionalMiddle {
  inA: Int;
  inB: Int?;
}

struct OptionalOuter {
  nested: OptionalMiddle?;
  num: Int;
}

contract OptionalCascade {
  store: OptionalOuter;

  init() {
    self.store = OptionalOuter{
      nested: OptionalMiddle{
        inA: 1,
        inB: null
      },
      num: 2
    };
  }
}