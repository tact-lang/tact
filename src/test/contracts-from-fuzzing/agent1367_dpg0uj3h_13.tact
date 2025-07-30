struct Base {
  v1: Int?;
  v2: Int?;
}

struct Middle {
  left: Base;
  right: Base;
}

struct Outer {
  m1: Middle;
  m2: Middle;
}

contract SymmetricNesting {
  state: Outer;

  init() {
    self.state = Outer{
      m1: Middle{
        left: Base{v1: null, v2: null},
        right: Base{v1: null, v2: null},
      },
      m2: Middle{
        left: Base{v1: null, v2: null},
        right: Base{v1: null, v2: null},
      },
    };
  }
}