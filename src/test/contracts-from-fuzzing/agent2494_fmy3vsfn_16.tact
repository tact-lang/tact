struct SubS {
  x: Int?;
}

struct S {
  s1: SubS;
  s2: SubS;
}

contract OptStructs {
  g: S;

  init() {
    self.g = S{
      s1: SubS{x:null},
      s2: SubS{x:123}
    };
  }
}