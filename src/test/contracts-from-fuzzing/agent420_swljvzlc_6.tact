struct InnerMost {
  v: Int?;
}

struct Mid {
  innerMost: InnerMost?;
}

struct Outer {
  mid: Mid?;
}

contract NestedOptionals {
  data: Outer;

  init() {
    self.data = Outer{
      mid: Mid{
        innerMost: InnerMost{
          v: null,
        },
      },
    };
  }
}