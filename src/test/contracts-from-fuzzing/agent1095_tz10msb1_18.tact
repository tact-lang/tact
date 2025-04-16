struct InnerS {
  a: Int;
  b: Bool;
}

struct WrapOpt {
  s: InnerS?;
  x: Int?;
}

contract OptionalWrap {
  store: WrapOpt?;

  init() {
    self.store = WrapOpt{
      s: InnerS{ a:1, b:false },
      x: null
    };
  }
}