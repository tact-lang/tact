struct Shuffle {
  a: Int;
  b: Bool?;
  c: String;
  d: Address?;
  e: Int as uint8;
  f: Slice?;
  g: Cell;
  h: Bool;
  i: String?;
  j: Int;
}

contract OrderCase {
  store: Shuffle;
  init() {
    self.store = Shuffle{
      a: 10,
      b: null,
      c: "str",
      d: null,
      e: 7,
      f: null,
      g: emptyCell(),
      h: false,
      i: null,
      j: -999
    };
  }
}