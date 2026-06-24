struct OptNested {
  value: Int?;
}

struct LayeredOptional {
  optionalField: OptNested?;
  another: Int;
}

contract OptionalFieldStruct {
  state: LayeredOptional;

  init() {
    self.state = LayeredOptional{
      optionalField: null,
      another: 77
    };
  }
}