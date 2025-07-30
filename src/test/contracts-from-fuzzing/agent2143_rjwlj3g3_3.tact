struct BigStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: Bool;
  h: Int;
  i: String;
  j: Address;
}

contract LargeStructInStorage {
  data: BigStruct;

  init() {
    self.data = BigStruct{
      a: 1,
      b: true,
      c: "Hello",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: myAddress(),
      g: false,
      h: 42,
      i: "World",
      j: myAddress()
    };
  }
}