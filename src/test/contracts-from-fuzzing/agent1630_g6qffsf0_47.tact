struct Inner {
  s: String;
  b: Bool;
}

struct OuterOpt {
  inner: Inner?;
}

contract NullNestedInner {
  val: OuterOpt;

  init() {
    self.val = OuterOpt{ inner: null };
  }
}