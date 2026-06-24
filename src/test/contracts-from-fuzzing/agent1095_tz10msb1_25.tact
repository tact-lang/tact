struct S0 {
  a: Int;
  b: Bool?;
}

struct S1 {
  f: S0;
}

contract RecursionSimple {
  s: S1;

  init() {
    self.s = S1{
      f: S0{
        a: 5,
        b: null
      }
    };
  }
}