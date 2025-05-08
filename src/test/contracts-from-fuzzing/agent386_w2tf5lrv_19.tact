struct SOpt {
  foo: Int?;
  bar: Bool?;
}

contract NestedNullDefault {
  nested: SOpt = SOpt{foo: null, bar: null};

  init() {
    self.nested = SOpt{foo: 555, bar: true};
  }
}
