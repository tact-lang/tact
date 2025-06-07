struct Inner1 { x: Int }
struct Inner2 { y: Int? }

struct BigNest {
  a: Inner1;
  b: Inner2;
  c: Inner1?;
  d: Inner2?;
}

contract Test {
  nested: BigNest;

  init() {
    self.nested = BigNest{
      a: Inner1{ x: 11 },
      b: Inner2{ y: null },
      c: null,
      d: null,
    };
  }
}
