struct SOOO {
  a: Int? as coins;
  b: Int?;
}

contract OptionalSerNest {
  s: SOOO;

  init() {
    self.s = SOOO{ a: null, b: null };
  }
}
