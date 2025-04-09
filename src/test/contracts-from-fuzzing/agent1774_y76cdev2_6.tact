struct S1 {
  v1: Int;
  v2: Bool?;
}

struct S2 {
  s1a: S1;
  s1b: S1;
  s1c: S1;
}

contract TestContract {
  pair: S2;

  init() {
    self.pair = S2{
      s1a: S1{v1:1, v2:true},
      s1b: S1{v1:2, v2:null},
      s1c: S1{v1:3, v2:false},
    };
  }
}
