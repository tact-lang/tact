struct Mid {
  foo: Int;
  bar: Int;
}

struct Top {
  m1: Mid;
  m2: Mid;
  m3: Mid;
}

contract TupleStructs {
  top: Top;

  init() {
    self.top = Top{
      m1: Mid{foo:1, bar:2},
      m2: Mid{foo:3, bar:4},
      m3: Mid{foo:5, bar:6}
    };
  }
}
