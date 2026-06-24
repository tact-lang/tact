struct InnerMost {
  z: Bool?;
}

struct Inner {
  y: InnerMost;
}

contract MultiInnerOptional {
  val: Inner;

  init() {
    self.val = Inner{ y: InnerMost{ z: null } };
  }
}