struct Combo {
  a: Int;
  b: Bool?;
  c: String;
  d: Sub;
}

struct Sub {
  x: Int;
  y: Bool;
}

contract StructCombo {
  combo: Combo;

  init() {
    self.combo = Combo{
      a: 42,
      b: null,
      c: "hi",
      d: Sub{
        x: 10,
        y: true
      }
    };
  }
}
