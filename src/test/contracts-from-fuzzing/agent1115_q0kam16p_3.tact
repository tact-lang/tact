struct Inner {
  foo: Int;
}

struct Mid {
  inner: Inner;
}

struct Outer {
  mid: Mid;
}

contract TestContract {
  nested: Outer;

  init() {
    self.nested = Outer{ mid: Mid{ inner: Inner{ foo: 123 } } };
  }
}