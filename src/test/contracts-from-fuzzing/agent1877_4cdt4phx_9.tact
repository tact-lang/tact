struct NestedOptionals {
  a: Int?;
  b: InnerOpt?;
}

struct InnerOpt {
  c: Int?;
  d: Bool?;
}

contract NestedOptStore {
  opt: NestedOptionals;

  init() {
    self.opt = NestedOptionals{
      a:null,
      b: InnerOpt{
        c:null,
        d:null
      }
    };
  }
}
