struct BigNested {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Bool?;
  g: Int?;
}

contract MultiTypeFields {
  val: BigNested;

  init() {
    self.val = BigNested{
      a: 1,
      b: false,
      c: "hello",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: null,
      g: 7
    };
  }
}