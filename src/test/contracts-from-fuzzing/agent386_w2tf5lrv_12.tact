struct S1 {
  s2: S2;
  flag: Bool;
}

struct S2 {
  num: Int;
  str: String;
}

contract MixedTypes {
  s: S1 = S1{s2: S2{num: 99, str: "hi"}, flag: false};

  init() {
    self.s = S1{s2: S2{num: 123, str: "there"}, flag: true};
  }
}
