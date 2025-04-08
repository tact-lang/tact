struct InnerMost {
  flag: Bool;
}

struct Inner {
  inner: InnerMost;
}

struct MiddleOptional {
  maybeInner: Inner?;
}

struct TopStruct {
  m: MiddleOptional;
}

contract Test10 {
  t: TopStruct;

  init() {
    self.t = TopStruct{
      m: MiddleOptional{ maybeInner: Inner{inner: InnerMost{flag:true}} }
    };
  }
}