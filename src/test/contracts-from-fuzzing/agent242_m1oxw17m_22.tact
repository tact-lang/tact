struct DeepOptionalDefaults {
  a: Int?;
  nested: NestedOptionalDefaults?;
}

struct NestedOptionalDefaults {
  b: Int?;
  c: Bool?;
}

contract DeepOptDefaults {
  field: DeepOptionalDefaults;

  init() {
    self.field = DeepOptionalDefaults{
      a: null,
      nested: null,
    };
  }
}