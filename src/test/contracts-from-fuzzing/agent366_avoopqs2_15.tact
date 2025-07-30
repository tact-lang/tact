struct InnerMost {
  a: Int;
  b: Bool;
}

struct InnerOpt {
  inner: InnerMost?;
  str: String?;
}

struct MidNest {
  opt: InnerOpt;
  flag: Bool;
}

contract DeeplyOptional {
  nest: MidNest;
  init() {
    self.nest = MidNest{
      opt: InnerOpt{
        inner: null,
        str: null
      },
      flag: true
    };
  }
}