struct StringOpt {
  foo: String?;
  bar: String?;
}

contract TestContract {
  s: StringOpt;

  init() {
    self.s = StringOpt {
      foo: null,
      bar: "Hi"
    };
  }
}