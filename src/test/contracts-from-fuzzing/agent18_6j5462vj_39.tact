struct NestedOpt {
  foo: Int?;
  bar: String?;
}

contract DoubleDefault {
  nested: NestedOpt = NestedOpt{ foo: null, bar: null };

  init() {
    self.nested = NestedOpt{ foo: 123, bar: "hi" };
  }
}