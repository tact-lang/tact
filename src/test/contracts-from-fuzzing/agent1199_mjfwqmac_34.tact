struct Nester {
  inner1: NestedOpt;
  inner2: NestedOpt?;
}

struct NestedOpt {
  f1: Int?;
  f2: String?;
}

contract Test34 {
  n: Nester;

  init() {
    self.n = Nester{
      inner1: NestedOpt{f1: null, f2: null},
      inner2: null
    };
  }
}