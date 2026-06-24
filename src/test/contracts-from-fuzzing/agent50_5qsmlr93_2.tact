struct Inner {
  x: Int;
  y: Int?;
}

struct Outer {
  a: Int;
  inn: Inner;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      a: 1,
      inn: Inner{
        x: 2,
        y: null,
      },
    };
  }
}