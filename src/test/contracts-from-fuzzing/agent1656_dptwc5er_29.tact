struct Compose {
  a: Int;
  b: Bool;
}

contract TopLevel {
  s1: Compose;
  s2: Compose;

  init() {
    self.s1 = Compose{ a: 1, b: true };
    self.s2 = Compose{ a: 2, b: false };
  }
}
