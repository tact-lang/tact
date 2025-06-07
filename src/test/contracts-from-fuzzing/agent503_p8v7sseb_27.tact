struct DeepInner {
  val: Int;
}

struct WrapOpt {
  nest: DeepInner?;
}

contract OptDeepInner {
  data: WrapOpt;

  init() {
    self.data = WrapOpt{
      nest: DeepInner{ val: 55 }
    };
  }
}
