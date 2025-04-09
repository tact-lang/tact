struct NestedWithOptDefaults {
  val: Int? = null;
  flag: Bool? = null;
}

contract OptDefaultsOuter {
  nested: NestedWithOptDefaults;

  init() {
    self.nested = NestedWithOptDefaults{};
  }
}