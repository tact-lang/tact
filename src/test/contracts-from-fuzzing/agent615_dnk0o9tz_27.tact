struct OptInner {
  ss: Int?;
}

struct OuterOpt {
  s: OptInner?;
}

contract TestContract {
  s: OuterOpt;

  init() {
    self.s = OuterOpt{ s: OptInner{ ss:null } };
  }
}