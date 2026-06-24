struct SDefaultOpt {
  a: Int?;
  b: String?;
}

contract Test {
  f1: SDefaultOpt?;
  f2: SDefaultOpt?;

  init() {
    self.f1 = null;
    self.f2 = SDefaultOpt{a:null,b:null};
  }
}
