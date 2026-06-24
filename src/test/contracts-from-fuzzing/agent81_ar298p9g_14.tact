struct Outer {
  i: Int;
  nested: Inner;
}

struct Inner {
  b: Bool;
  opt: Int?;
}

contract TestContract {
  field: Outer;

  init() {
    self.field = Outer{ i: 11, nested: Inner{ b: true, opt: null } };
  }
}