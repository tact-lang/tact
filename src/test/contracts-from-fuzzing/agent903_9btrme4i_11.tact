struct OptsDefaults {
  foo: Int? = null;
  bar: Bool? = null;
  txt: String? = null;
}

contract OptsDefaultsContract {
  data: OptsDefaults;

  init() {
    self.data = OptsDefaults{};
  }
}