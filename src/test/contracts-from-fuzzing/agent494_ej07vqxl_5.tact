struct Large {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
  g: Bool?;
  h: Int?;
}

contract ManyFields {
  big: Large;

  init() {
    self.big = Large{
      a: 1,
      b: true,
      c: myAddress(),
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: "hi",
      g: null,
      h: null
    };
  }
}