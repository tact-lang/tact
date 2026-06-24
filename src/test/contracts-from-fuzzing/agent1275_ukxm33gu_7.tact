struct DefaultOpt {
  foo: Int?;
  bar: String?;
  baz: Bool?;
}

contract OptionalFieldsDefaults {
  state: DefaultOpt;

  init() {
    self.state = DefaultOpt{
      foo: null,
      bar: null,
      baz: null
    };
  }
}