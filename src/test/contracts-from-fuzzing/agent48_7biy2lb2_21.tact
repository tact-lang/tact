struct Mid {
  a: Int;
  b: Int?;
}

struct Out {
  m1: Mid;
  m2: Mid;
}

contract TestContract {
  field: Out;

  init() {
    self.field = Out {
      m1: Mid{ a: 42, b: null },
      m2: Mid{ a: 99, b: 100 }
    };
  }
}