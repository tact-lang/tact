struct S1 {
  b1: Bool;
  o1: Bool?;
}

struct S2 {
  s1a: S1;
  s1b: S1;
  s1c: S1?;
}

contract BoolOptionals {
  data: S2;
  init() {
    self.data = S2{
      s1a: S1{b1:true,o1:null},
      s1b: S1{b1:false,o1:true},
      s1c: null
    };
  }
}