struct Combo {
  a: Int;
  b: Bool;
}

contract ComboDirect {
  s: Combo;
  x: Int;

  init() {
    self.s = Combo{ a: 1, b: false };
    self.x = 5;
  }
}
