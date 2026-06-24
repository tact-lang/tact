struct DeepInner {
  deep: Int;
}

struct MiddleOpt {
  m: DeepInner?;
}

contract OptionalMiddle {
  val: MiddleOpt;

  init() {
    self.val = MiddleOpt{
      m: null
    };
  }
}