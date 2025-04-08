struct InnerMost {
  val: Int;
  flag: Bool;
}

struct InnerOpt {
  inner: InnerMost?;
}

struct OuterOpt {
  wrap: InnerOpt?;
}

contract DeepOptional {
  d: OuterOpt;

  init() {
    self.d = OuterOpt{
      wrap: InnerOpt{
        inner: null,
      },
    };
  }
}