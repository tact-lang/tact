struct Small {
  x: Int;
}

struct Mid {
  a: Small;
  b: Small;
}

struct Outer {
  m: Mid;
  flag: Bool?;
}

contract ComposeTest {
  data: Outer;
  init() {
    self.data = Outer {
      m: Mid {
        a: Small{ x: 1 }, b: Small{ x: 2 }
      },
      flag: null
    };
  }
}
