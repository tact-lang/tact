struct Nested {
  s1: Inner;
  s2: InnerOpt;
}

struct Inner {
  m: Int;
  n: Int;
}

struct InnerOpt {
  m: Int?;
  n: Int?;
}

contract Test {
  nested: Nested;

  init() {
    self.nested = Nested{
      s1: Inner{ m: 10, n: 20 },
      s2: InnerOpt{ m: null, n: 40 }
    };
  }
}