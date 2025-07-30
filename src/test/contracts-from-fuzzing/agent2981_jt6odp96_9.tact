struct InnerMost {
  a: Int;
  b: Bool;
}

struct Mid {
  m1: InnerMost;
  m2: InnerMost?;
}

struct Outermost {
  o1: Mid;
  o2: Mid?;
}

contract NestedOptionals {
  data: Outermost;

  init() {
    self.data = Outermost{
      o1: Mid{
        m1: InnerMost{ a: 1, b: true },
        m2: null,
      },
      o2: null,
    };
  }
}