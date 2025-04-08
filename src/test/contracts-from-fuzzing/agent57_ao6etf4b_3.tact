struct Params {
  a: Int;
  b: Cell;
  c: Int?;
  d: map<Int, Int>;
}

contract Test {
  p: Params;

  init() {
    self.p = Params{
      a: 1,
      b: emptyCell(),
      c: null,
      d: emptyMap(),
    };
  }
}