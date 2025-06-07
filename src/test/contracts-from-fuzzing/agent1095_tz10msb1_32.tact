struct SmallOpt {
  a: Int?;
}

struct OuterOpt {
  inner: SmallOpt?
}

contract OptOverOpt {
  s: OuterOpt?;

  init() {
    self.s = OuterOpt{
      inner: SmallOpt{ a: null }
    };
  }
}