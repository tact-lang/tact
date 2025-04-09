struct BigNested {
  inner1: Inner;
  inner2: Inner;
  inner3: Inner;
}

struct Inner {
  a: Int;
  b: Bool?;
}

contract Test {
  state: BigNested;

  init() {
    self.state = BigNested{
      inner1: Inner{a: 1, b: null},
      inner2: Inner{a: 2, b: true},
      inner3: Inner{a: 3, b: false}
    };
  }
}