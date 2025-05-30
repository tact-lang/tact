struct TripleOpt {
  a: Int? = null;
  b: DoubleOpt? = null;
}

struct DoubleOpt {
  x: Int? = null;
  y: String? = null;
}

contract TestTripleOpt {
  v: TripleOpt;

  init() {
    self.v = TripleOpt{};
  }
}
