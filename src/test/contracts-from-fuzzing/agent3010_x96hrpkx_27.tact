struct SOpt {
  val: Int?;
}

struct SWrappedOpt {
  opt: SOpt?;
}

contract OptionalStructNested {
  f: SWrappedOpt;

  init() {
    self.f = SWrappedOpt{ opt: SOpt{ val: null } };
  }
}