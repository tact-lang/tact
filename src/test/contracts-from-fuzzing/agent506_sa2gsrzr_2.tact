struct InnerOpt {
  y: Int;
}

struct MiddleOpt {
  innerOpt: InnerOpt?;
}

contract OptionalNestedStorage {
  data: MiddleOpt?;

  init() {
    self.data = MiddleOpt{
      innerOpt: InnerOpt{
        y: 77
      }
    };
  }
}