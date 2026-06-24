struct OptionalBuilder {
  opt: Builder?;
}

contract StructOptionalBuilderVar {
  s: OptionalBuilder;

  init() {
    self.s = OptionalBuilder{opt: null};
  }
}