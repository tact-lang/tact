struct NestedOptional {
  a: Int?;
  b: Bool?;
  c: String?;
}

struct HasNestedOptional {
  nested: NestedOptional;
}

contract NestedOptionalContract {
  data: HasNestedOptional;

  init() {
    self.data = HasNestedOptional{
      nested: NestedOptional{
        a: null,
        b: null,
        c: null
      }
    };
  }
}