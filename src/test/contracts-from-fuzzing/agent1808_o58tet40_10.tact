struct InnerMost {
  value: Int;
}

struct InnerLayer {
  a: InnerMost;
  b: InnerMost;
}

struct MidLayer {
  ia: InnerLayer;
  ib: InnerLayer;
}

struct OuterLayer {
  ma: MidLayer;
  mb: MidLayer;
}

contract WideDeep {
  state: OuterLayer;

  init() {
    self.state = OuterLayer{
      ma: MidLayer{
        ia: InnerLayer{ a: InnerMost{ value: 1 }, b: InnerMost{ value: 2 } },
        ib: InnerLayer{ a: InnerMost{ value: 3 }, b: InnerMost{ value: 4 } }
      },
      mb: MidLayer{
        ia: InnerLayer{ a: InnerMost{ value: 5 }, b: InnerMost{ value: 6 } },
        ib: InnerLayer{ a: InnerMost{ value: 7 }, b: InnerMost{ value: 8 } }
      }
    };
  }
}