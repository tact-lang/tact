struct StrNest {
  val: String;
}

struct HasStr {
  inner: StrNest;
  tag: String;
}

contract Test {
  f: HasStr;
  init() {
    self.f = HasStr{
      inner: StrNest{ val: "abc" },
      tag: "def"
    };
  }
}
