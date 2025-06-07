struct Inner {
  x: Int;
  y: Int?;
}

struct Outer {
  coord: Inner;
  name: String?;
}

contract TestNested {
  data: Outer;

  init() {
    self.data = Outer{
      coord: Inner{ x: 1, y: null },
      name: null
    };
  }
}