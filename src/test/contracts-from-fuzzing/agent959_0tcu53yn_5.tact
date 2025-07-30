struct OptionalNest {
  foo: Int?;
  bar: Inner?;
}

struct Inner {
  baz: String?;
}

contract OptionalStruct {
  opt: OptionalNest;

  init() {
    self.opt = OptionalNest{
      foo: null,
      bar: Inner{baz: null}
    };
  }
}