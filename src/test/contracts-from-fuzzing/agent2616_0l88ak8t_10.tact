struct NestedOptDefaults {
  intOpt: Int? = null;
  boolOpt: Bool? = null;
  strOpt: String? = null;
}

contract DefaultsContract {
  pfield: NestedOptDefaults;

  init() {
    self.pfield = NestedOptDefaults{};
  }
}
