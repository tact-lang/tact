struct NestedOptional {
  field1: Int?;
  field2: Bool?;
  nested: InnerStructWithOptional?;
}

struct InnerStructWithOptional {
  inside: Bool?;
}

contract TestContract {
  val: NestedOptional;

  init() {
    self.val = NestedOptional{
      field1: null,
      field2: true,
      nested: null,
    };
  }
}
