struct NestedOptDefaults {
  inner: Int? = null;
}

contract NullDef {
  data: NestedOptDefaults;

  init() {
    self.data = NestedOptDefaults{};
  }
}
