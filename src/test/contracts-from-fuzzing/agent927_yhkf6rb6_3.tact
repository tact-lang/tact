struct OptionalDeep {
  foo: Int?;
  bar: Bool?;
  nested: NestedOpt?;
}

struct NestedOpt {
  x: Int?;
  y: Bool?;
}

contract OptionalDeepTest {
  storage: OptionalDeep;

  init() {
    self.storage = OptionalDeep{
      foo: null,
      bar: true,
      nested: NestedOpt{
        x: null,
        y: false
      }
    };
  }
}