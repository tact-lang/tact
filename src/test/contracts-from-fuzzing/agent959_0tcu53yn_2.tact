struct Large {
  a: Int;
  b: Int?;
  c: String;
  d: Cell;
  e: Slice;
  f: Bool;
  g: String?;
  h: Int;
  i: String;
  j: Bool?;
}

contract ManyFields {
  data: Large;
  init() {
    self.data = Large{
      a: 1,
      b: null,
      c: "hello",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: true,
      g: null,
      h: 2,
      i: "world",
      j: false,
    };
  }
}