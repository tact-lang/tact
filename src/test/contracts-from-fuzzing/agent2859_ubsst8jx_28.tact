struct NestedOpt {
  a: Int?;
  b: Bool?;
}

struct WrapOpt {
  nested: NestedOpt?;
}

contract OptionInOption {
  field: WrapOpt;

  init() {
    self.field = WrapOpt{ nested: null };
  }
}