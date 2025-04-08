struct NestedString {
  text: String;
}

struct WrappedStringOpt {
  val: NestedString?;
}

contract OptNestedString {
  field: WrappedStringOpt;
  init() {
    self.field = WrappedStringOpt{ val: null };
  }
}
