struct InnerMost {
  flag: Bool;
}

struct InnerOpt {
  val: InnerMost?;
}

struct MiddleOpt {
  inner: InnerOpt?;
}

contract DeepOptionals {
  layer: MiddleOpt?;

  init() {
    self.layer = null;
  }
}