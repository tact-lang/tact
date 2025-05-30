struct Nested {
  a: Int;
  b: Int?;
  c: Inner;
}

struct Inner {
  i: Int;
  j: Bool;
}

contract Test {
  data: Nested;

  init() {
    self.data = Nested{
      a: 1,
      b: null,
      c: Inner{
        i: 2,
        j: true,
      },
    };
  }
}
