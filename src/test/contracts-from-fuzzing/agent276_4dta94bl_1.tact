struct Nested {
  a: Int;
  b: Int?;
  c: Inner;
}

struct Inner {
  d: Int;
}

contract Test {
  data: Nested;

  init() {
    self.data = Nested{
      a: 1,
      b: null,
      c: Inner{d: 2},
    };
  }
}
