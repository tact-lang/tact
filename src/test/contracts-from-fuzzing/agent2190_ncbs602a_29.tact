struct SSS {
  a: Int;
}

contract ManySameStructs {
  f1: SSS;
  f2: SSS;
  f3: SSS;

  init() {
    self.f1=SSS{a:1};
    self.f2=SSS{a:2};
    self.f3=SSS{a:3};
  }
}