// optional nested deep fields
struct InnerMost {
  val: Int;
}

struct InnerOpt {
  innerMost: InnerMost?;
}

struct Container {
  maybeInner: InnerOpt?;
}

contract ComplexOptionals {
  nested: Container?;

  init() {
    self.nested = null;
  }
}