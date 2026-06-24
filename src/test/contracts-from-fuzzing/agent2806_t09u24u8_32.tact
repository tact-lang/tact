struct NestedOptDefaults {
  a: Int? = null;
  b: Bool? = false;
  c: String? = null;
}

struct TopLevel {
  nested: NestedOptDefaults;
  d: Int;
}

contract NestedOptional {
  val: TopLevel;
  init() {
    self.val = TopLevel{
      nested: NestedOptDefaults{},
      d: 123
    };
  }
}