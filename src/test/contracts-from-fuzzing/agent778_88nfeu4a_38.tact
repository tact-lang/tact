struct SSub {
  a: Int; b: Int; c: Int;
}

struct SSub2 {
  d: Bool; e: Bool; f: Bool;
}

struct SMain {
  s1: SSub;
  s2: SSub2;
  opt: Int?;
}

contract HasMultipleStructs {
  x: SMain = SMain{s1:SSub{a:1,b:2,c:3}, s2:SSub2{d:true,e:false,f:true}, opt:null};

  init() {
    self.x = SMain{s1:SSub{a:1,b:2,c:3}, s2:SSub2{d:true,e:false,f:true}, opt:null};
  }
}