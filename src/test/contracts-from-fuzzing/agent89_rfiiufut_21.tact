struct InnerStr {
  s: String;
}

struct OuterStr {
  i: InnerStr;
}

contract NestedStrings {
  s: OuterStr;

  init() {
    self.s = OuterStr{ i: InnerStr{ s: "hello" } };
  }
}
