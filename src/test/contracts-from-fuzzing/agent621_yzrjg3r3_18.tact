struct NestedOptionalString {
  inner: InnerString?;
}

struct InnerString {
  val: String?;
}

contract Test {
  s: NestedOptionalString;

  init() {
    self.s = NestedOptionalString{
      inner: null
    };
  }
}
