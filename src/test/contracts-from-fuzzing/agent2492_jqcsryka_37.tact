struct InnerMostOpt {
  d: Int?;
}

struct InnerOpt {
  c: InnerMostOpt;
}

struct OuterOpt {
  b: InnerOpt;
}

contract NestedDeepOpt {
  a: OuterOpt;

  init() {
    self.a = OuterOpt{
      b: InnerOpt{
        c: InnerMostOpt{
          d: null
        }
      }
    };
  }
}