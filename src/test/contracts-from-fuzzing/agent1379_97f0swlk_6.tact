struct Combo {
  a: Int;
  b: Bool?;
  c: String;
  d: Address?;
  e: Cell;
  f: Slice?;
}

contract ComboContract {
  combo: Combo;

  init() {
    self.combo = Combo{
      a: 1,
      b: true,
      c: "hello",
      d: null,
      e: emptyCell(),
      f: null
    };
  }
}
