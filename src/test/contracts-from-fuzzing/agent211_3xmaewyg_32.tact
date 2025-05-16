struct NestedOptDefaults {
  optInt: Int? = null;
  optBool: Bool? = null;
}

contract NestedOptionalsDefaults {
  data: NestedOptDefaults;

  init() {
    self.data = NestedOptDefaults{};
  }
}
