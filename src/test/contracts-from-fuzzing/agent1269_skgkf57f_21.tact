struct InnerS {
  f1: Int;
  f2: Int?;
}

struct OuterS {
  s: InnerS;
  opt: Int?;
}

contract MixNestedOpt {
  st: OuterS;
  init() {
    self.st = OuterS{
      s: InnerS{ f1:5, f2:null },
      opt: null,
    };
  }
}