struct Complex {
  a: Int = 5;
  b: Bool?;
  c: String;
  d: Int?;
  e: Bool = false;
  f: Slice;
  g: Int?;
  h: Cell;
}

contract Mix {
  persist: Complex;

  init() {
    self.persist = Complex{
      a: 7,
      b: null,
      c: "hi",
      d: 10,
      e: true,
      f: emptyCell().asSlice(),
      g: null,
      h: emptyCell()
    };
  }
}