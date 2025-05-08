struct InnerOpt {
  opt: String?;
}

contract NestedOptional {
  nested: InnerOpt?;

  init() {
    self.nested = null;
  }
}
