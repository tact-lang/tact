struct Inner {
  s: String;
  opt: Int?;
}

contract OptionalStringNested {
  val: Inner?;

  init() {
    self.val = Inner{ s: "aa", opt: null };
  }
}
