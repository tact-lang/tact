struct Inner {
  val: Int;
}

struct Outer {
  inner1: Inner;
  inner2: Inner;
  inner3: Inner;
}

contract NestedMany {
  data: Outer;

  init() {
    self.data = Outer{
      inner1: Inner{ val: 1 },
      inner2: Inner{ val: 2 },
      inner3: Inner{ val: 3 }
    };
  }
}
