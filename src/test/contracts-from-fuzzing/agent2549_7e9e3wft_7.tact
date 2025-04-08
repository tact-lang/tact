struct S1 {
  a: Int?;
  b: Bool?;
}

struct S2 {
  s1: S1?;
  s2: S1; 
}

contract OptNested {
  data: S2;

  init() {
    self.data = S2{
      s1: null,
      s2: S1{
        a: 55,
        b: false,
      },
    };
  }
}