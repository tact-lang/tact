struct S1 {
  a: Int;
  b: Bool;
}

struct S2 {
  c: String;
  d: Int?;
}

struct BigMix {
  s1: S1;
  s2: S2;
  e: Bool?;
  f: String;
}

contract ComboTest {
  data: BigMix;
  init() {
    self.data = BigMix{
      s1: S1{
        a: 1,
        b: false
      },
      s2: S2{
        c: "c",
        d: null
      },
      e: null,
      f: "done"
    };
  }
}