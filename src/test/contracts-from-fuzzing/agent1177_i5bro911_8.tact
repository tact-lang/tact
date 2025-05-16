struct HasString {
  s: String;
}

struct DoubleString {
  s1: HasString;
  s2: HasString;
}

contract NestedStrings {
  val: DoubleString;

  init() {
    self.val = DoubleString{
      s1: HasString{ s: "foo" },
      s2: HasString{ s: "bar" }
    };
  }
}
