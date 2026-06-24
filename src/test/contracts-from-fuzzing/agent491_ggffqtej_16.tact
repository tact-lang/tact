struct HasStr {
  s: String;
}

struct HasInnerStr {
  inner: HasStr;
}

contract ContractStr {
  field: HasInnerStr;

  init() {
    self.field = HasInnerStr{ inner: HasStr{ s: "hello" } };
  }
}
