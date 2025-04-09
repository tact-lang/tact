struct InnerOptStr {
  foo: String?;
}

struct OuterOpt {
  s: InnerOptStr?;
}

contract OptStructOptField {
  val: OuterOpt;

  init() {
    self.val = OuterOpt{ s: null };
  }
}