struct NestedOptionalStruct {
  a: Int;
  b: Bool?;
  c: String?;
}

contract NestedOptionalsV2 {
  nested: NestedOptionalStruct?;

  init() {
    self.nested = NestedOptionalStruct{
      a: 1,
      b: null,
      c: "hello"
    };
  }
}
