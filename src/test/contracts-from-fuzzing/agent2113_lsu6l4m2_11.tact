struct S1 {
  f1: Int?;
  f2: Bool?;
  f3: String?;
  f4: Cell?;
  f5: Slice?;
  f6: Address?;
}

struct S2 {
  s1: S1;
  s1opt: S1?;
}

contract ManyNullableEmbedded {
  s2: S2;

  init() {
    self.s2 = S2{
      s1: S1{
        f1:null, f2:null,f3:null,f4:null,f5:null,f6:null
      },
      s1opt: null
    };
  }
}