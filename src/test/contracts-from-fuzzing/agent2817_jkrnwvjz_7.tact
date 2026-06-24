struct OptionalInOptional {
  name: String?;
  num: Int?;
}

contract NullInit {
  foo: OptionalInOptional;

  init() {
    self.foo = OptionalInOptional{ name: null, num: null };
  }
}
