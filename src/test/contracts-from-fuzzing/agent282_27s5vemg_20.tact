struct HasAddress {
  addr: Address;
}

struct ContainsOptionals {
  i: Int?;
  b: Bool?;
  s: String?;
  nested: HasAddress?;
}

contract OptNestedStruct {
  field: ContainsOptionals;

  init() {
    self.field = ContainsOptionals{
      i: null,
      b: null,
      s: null,
      nested: null,
    };
  }
}