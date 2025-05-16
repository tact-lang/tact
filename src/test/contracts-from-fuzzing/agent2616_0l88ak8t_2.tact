struct HasOptionalDeep {
  field1: Int?;
  field2: String?;
  field3: Bool?;
}

struct WrapsOptional {
  nested: HasOptionalDeep?;
}

contract OptionalNestTest {
  state: WrapsOptional;

  init() {
    self.state = WrapsOptional{
      nested: HasOptionalDeep{field1: 10, field2: null, field3: true}
    };
  }
}