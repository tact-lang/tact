struct Leaf {
  n: Int as uint16;
}

struct Mid {
  leafOpt: Leaf?;
}

struct Root {
  midOpt: Mid?;
}

contract TestContract {
  root: Root;

  init() {
    self.root = Root{
      midOpt: null
    };
  }
}