struct OptionalDeep {
  foo: Inner?;
}

struct Inner {
  bar: Int?;
  baz: Another?;
}

struct Another {
  qux: Int;
}

contract TestContract {
  data: OptionalDeep;

  init() {
    self.data = OptionalDeep{
      foo: Inner{bar: null, baz: null}
    };
  }
}
