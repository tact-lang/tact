struct HasBuilder {
  b: Builder;
}

contract StructBuilderVar {
  s: HasBuilder;

  init() {
    self.s = HasBuilder{b: beginCell()};
  }
}