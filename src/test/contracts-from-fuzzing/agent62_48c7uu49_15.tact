struct Mix {
  prefix: Cell;
  a: Int?;
  b: Bool?;
  c: Int;
}

contract Test15 {
  payload: Mix;
  init() {
    self.payload = Mix{
      prefix: emptyCell(),
      a: null,
      b: true,
      c: 42
    };
  }
}