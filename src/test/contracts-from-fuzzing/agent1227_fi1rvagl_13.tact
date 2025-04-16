struct Leaf {
  v: Int;
}
struct Mid {
  leafOpt: Leaf?;
  leafNonOpt: Leaf;
}
contract MixedOpt {
  midOpt: Mid?;
  midNonOpt: Mid;
  init() {
    self.midOpt = null;
    self.midNonOpt = Mid{
      leafOpt: null,
      leafNonOpt: Leaf{v:0}
    };
  }
}
