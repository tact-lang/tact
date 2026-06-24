struct S {
 x: Int?;
 y: String;
}

contract SChain {
  s1: S;
  s2: S?;

  init() {
    self.s1 = S{ x: null, y: "a" };
    self.s2 = S{ x: 55, y: "b" };
  }
}
