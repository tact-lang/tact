struct InnerMost {
  val: Int;
}

struct Inner {
  n1: InnerMost;
  n2: InnerMost;
}

struct Mid {
  i1: Inner;
  i2: Inner;
}

struct Outer {
  m: Mid;
}

contract ManyNestingLevels {
  f: Outer;

  init() {
    self.f = Outer{
      m: Mid{
        i1: Inner{
          n1: InnerMost{ val: 1 },
          n2: InnerMost{ val: 2 }
        },
        i2: Inner{
          n1: InnerMost{ val: 3 },
          n2: InnerMost{ val: 4 }
        }
      }
    };
  }
}