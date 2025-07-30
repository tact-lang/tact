struct Middle {
  f: Int?;
}

struct Outer {
  a: Int;
  b: Middle;
}

contract OptionalMiddle {
  state: Outer;

  init() {
    self.state = Outer{
      a: 777,
      b: Middle{ f: null }
    };
  }
}