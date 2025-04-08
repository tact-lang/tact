struct NestedWithDefaults {
  inner: Int = 5;
  text: String = "hey";
}

struct OuterDefaults {
  nested: NestedWithDefaults;
  optText: String? = null;
  flag: Bool = false;
}

contract DefaultsNested {
  s: OuterDefaults;

  init() {
    self.s = OuterDefaults{
      nested: NestedWithDefaults{},
    };
  }
}