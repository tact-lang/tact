struct NestedOpt {
  innerOpt: Int?;
}

contract OptionalNestedField {
  nested: NestedOpt?;

  init() {
    self.nested = NestedOpt{
      innerOpt: 42
    };
  }
}
