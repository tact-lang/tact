struct OptDeep {
  innerVal: Int?;
  nestedInner: InnerMost?;
}

struct InnerMost {
  x: Int?;
  y: Bool?;
}

contract TestContract {
  storage: OptDeep;

  init() {
    self.storage = OptDeep{ innerVal: null, nestedInner: null };
  }
}