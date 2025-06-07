struct NestedOptional {
  foo: Int?;
  bar: Bool?;
}

struct HasNestedOpt {
  nested: NestedOptional?;
}

contract NullableNested {
  data: HasNestedOpt;

  init() {
    self.data = HasNestedOpt{
      nested: null
    };
  }
}