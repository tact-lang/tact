struct InnerOpt {
  a: Int?;
}

struct OuterOpt {
  i: InnerOpt;
}

contract OptInsideNested {
  data: OuterOpt;

  init() {
    self.data = OuterOpt{i: InnerOpt{a: null}};
  }
}