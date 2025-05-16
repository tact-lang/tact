struct Inner {
  x: Int;
  y: Int?;
}

struct Outer {
  i: Inner;
  flag: Bool;
}

contract InitPartialOptional {
  state: Outer;

  init() {
    self.state = Outer {
      i: Inner {
        x: 55,
        y: null
      },
      flag: false
    };
  }
}