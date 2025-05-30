struct Opts {
  a: Int?;
  b: Bool?;
  c: Int?;
  d: Bool?;
}

contract ManyOptionals {
  foo: Opts;

  init() {
    self.foo = Opts{
      a: null,
      b: null,
      c: null,
      d: null,
    };
  }
}
