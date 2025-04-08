struct Nested {
  a: Int;
  b: Bool?;
  c: Inner;
}

struct Inner {
  x: Int?;
  y: Bool;
}

contract TestContract {
  n: Nested;

  init() {
    self.n = Nested{
      a: 10,
      b: null,
      c: Inner{
        x: null,
        y: true
      }
    };
  }
}