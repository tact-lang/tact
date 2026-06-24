struct BigStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Address?;
}

contract BigFlatStorage {
  big: BigStruct;

  init() {
    self.big = BigStruct{
      a: 1,
      b: false,
      c: "",
      d: myAddress(),
      e: emptyCell(),
      f: emptyCell().asSlice(),
      g: null,
      h: null,
      i: null,
      j: null
    };
  }
}