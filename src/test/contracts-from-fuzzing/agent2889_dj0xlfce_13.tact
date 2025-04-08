struct S1 {
  a: Int;
}

struct S2 {
  s1: S1;
  str: String;
  flag: Bool?;
}

contract ManyNests {
  s2: S2;

  init() {
    self.s2 = S2{
      s1: S1{ a: 123 },
      str: "z",
      flag: true
    };
  }
}