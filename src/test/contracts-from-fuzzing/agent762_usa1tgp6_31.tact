struct InnerString {
  s: String;
}

struct OuterOpt {
  opt: InnerString?;
}

contract NestedStringOpt {
  field: OuterOpt?;

  init() {
    self.field = null;
  }
}