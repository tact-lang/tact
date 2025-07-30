struct NestedOpt {
  a: Int?;
  b: OptInner?;
}

struct OptInner {
  c: Int?;
  d: Bool?;
  e: String?;
}

contract OptComplex {
  st: NestedOpt;

  init() {
    self.st = NestedOpt{
      a:null,
      b: OptInner{
        c:null,
        d:true,
        e:null,
      },
    };
  }
}