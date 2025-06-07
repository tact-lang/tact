struct StringAndOptional {
  a: String;
  b: String?;
}

struct NestedStrings {
  parent: StringAndOptional;
  another: String;
}

contract StringTest {
  storage: NestedStrings;

  init() {
    self.storage = NestedStrings{
      parent: StringAndOptional{
        a: "foo",
        b: "bar",
      },
      another: "baz",
    };
  }
}