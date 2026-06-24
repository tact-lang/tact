struct NestedWithDefaults {
  i: Int = 99;
  s: String = "hi";
  f: Bool = false;
}

struct OuterWithNested {
  nested: NestedWithDefaults;
}

contract NestedDefaultsContract {
  field: OuterWithNested;

  init() {
    self.field = OuterWithNested{
      nested: NestedWithDefaults{}
    };
  }
}