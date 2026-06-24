struct NestedString {
  inner: String;
}

contract OptionalNestedString {
  nestedOpt: NestedString?;

  init() {
    self.nestedOpt = NestedString{ inner: "test" };
  }
}