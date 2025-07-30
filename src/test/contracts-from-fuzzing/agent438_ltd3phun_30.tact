struct WithStrings {
  a: String;
  b: String?;
}

struct WithBools {
  flag1: Bool;
  flag2: Bool?;
}

contract TestContract {
  s1: WithStrings;
  s2: WithBools;

  init() {
    self.s1 = WithStrings{ a:"abc", b:null };
    self.s2 = WithBools{ flag1:true, flag2:false };
  }
}