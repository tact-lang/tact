struct OptionNested {
  innerOpt: Inner?;
}

struct Inner {
  val: Int;
}

contract OptionalInner {
  val: OptionNested;

  init() {
    self.val = OptionNested{ innerOpt: null };
  }
}