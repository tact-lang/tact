struct HasStr {
  s: String;
  optInt: Int?;
}

struct AlsoHasStr {
  label: String;
  nested: HasStr;
}

contract NestedStrings {
  data: AlsoHasStr;

  init() {
    self.data = AlsoHasStr{
      label: "outer",
      nested: HasStr{ s: "inner", optInt: 55 }
    };
  }
}