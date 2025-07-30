struct Massive {
  i1: Int;
  i2: Int?;
  b: Bool?;
  s: String;
  c: Cell;
  a: Address?;
  s2: String?;
}

contract Test {
  data: Massive;
  init() {
    self.data = Massive{
      i1:1,
      s:"ok",
      c: emptyCell()
    };
  }
  receive() {}
}