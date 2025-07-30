struct NestedOptional {
  optStruct: StructIn?;
}

struct StructIn {
  foo: Int;
}

contract OptNested {
  data: NestedOptional;

  init() {
    self.data = NestedOptional{ optStruct: StructIn{foo:123} };
  }
}
