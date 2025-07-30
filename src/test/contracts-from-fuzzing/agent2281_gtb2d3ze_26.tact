struct S1 {
  a: Int;
}

struct S2 {
  b: Int?;
  s: S1;
}

contract MixOrder {
  data: S2;

  init() {
    self.data = S2{
      b:null,
      s:S1{a:42}
    };
  }
}