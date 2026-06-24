struct NestedEmptyDefault {
  foo: Int? = null;
  bar: Bool? = null;
}

contract TestNestedEmptyDefault {
  nested: NestedEmptyDefault;

  init() {
    self.nested = NestedEmptyDefault{};
  }
}
