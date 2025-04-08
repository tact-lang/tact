struct InnerMost {
  z: Int;
}

struct Mid {
  midVal: InnerMost?;
}

contract OptOptNest {
  top: Mid?;

  init() {
    self.top = null;
  }

  receive() {
    self.top = Mid{
      midVal: InnerMost{
        z: 777
      }
    };
  }
}