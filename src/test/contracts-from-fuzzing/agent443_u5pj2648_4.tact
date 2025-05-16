struct LargeStruct {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
  e: String?;
  f: Cell;
  g: Bool?;
  h: Int;
  i: String;
  j: Bool;
}

contract ManyFields {
  stuff: LargeStruct;

  init() {
    self.stuff = LargeStruct{
      a: 1,
      b: "b",
      c: true,
      d: null,
      e: null,
      f: emptyCell(),
      g: null,
      h: 2,
      i: "i",
      j: false
    };
  }
}