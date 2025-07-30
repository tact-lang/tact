struct OptNest {
  innerOpt: Int?;
}

struct DoubleOuter {
  outerOpt: OptNest?;
}

contract DeepOptionalContract {
  deep: DoubleOuter;

  init() {
    self.deep = DoubleOuter{
      outerOpt: OptNest{ innerOpt: null }
    };
  }
}