struct OptInner { v: Int?; }

struct WrapOpt {
  inner: OptInner?;
}

contract OptInOpt {
  w: WrapOpt;

  init() {
    self.w = WrapOpt{ inner: null };
  }
}