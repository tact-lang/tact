struct NestedOptional {
  a: Int?;
  b: Bool?;
  c: String?;
}

struct DeepOptional {
  nested: NestedOptional?;
  field: String;
}

contract OptionalDeep {
  data: DeepOptional;

  init() {
    self.data = DeepOptional{
      nested: null,
      field: "x"
    };
  }
}