struct OptionalInner {
  a: Int?;
  b: Bool?;
}

struct OptionalOuter {
  c: OptionalInner?;
}

contract OptNested {
  val: OptionalOuter;

  init() {
    self.val = OptionalOuter{ c: null };
  }
}