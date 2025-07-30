struct A { val: Int; }
struct B { val: Int; }
struct C { val: Int; }

struct Top {
    a: A?;
    b: B?;
    c: C?;
}

contract NullTop {
  f: Top;

  init() {
    self.f = Top{
      a: null,
      b: null,
      c: null,
    };
  }
}