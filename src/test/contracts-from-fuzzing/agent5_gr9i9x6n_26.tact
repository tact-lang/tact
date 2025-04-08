struct OptMixedDefaults {
  foo: Int?;
  bar: Bool = true;
  baz: String?;
}

contract OptDefaults {
  st: OptMixedDefaults;

  init() {
    self.st = OptMixedDefaults{
      foo: null,
      baz: null
    };
  }

  receive() {
    if (self.st.baz != null) {
      let _ = self.st.baz!!;
    }
  }
}
