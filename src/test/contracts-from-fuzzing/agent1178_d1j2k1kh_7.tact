struct Rec {
  a: Int;
  b: Int?;
  c: Int;
}

contract Test {
  x: Rec;
  init() {
    self.x = Rec{
      a: 5,
      b: null,
      c: 7,
    };
  }
}