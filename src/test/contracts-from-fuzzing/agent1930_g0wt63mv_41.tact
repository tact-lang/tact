struct Inner {
  foo: Int? = null;
}

struct Outer {
  bar: Inner;
}

contract OptionalDefaults {
  data: Outer;

  init() {
    self.data = Outer{ bar: Inner{ foo: null } };
  }
}