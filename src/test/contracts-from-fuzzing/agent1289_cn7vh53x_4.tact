struct BigStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: Bool?;
  h: Int?;
  i: Cell?;
  j: String?;
  k: Slice?;
  l: Address?;
}

contract LargeFieldsTest {
  record: BigStruct;

  init() {
    self.record = BigStruct{
      a: 1, b: true, c: "hi", d: emptyCell(), e: emptyCell().asSlice(), f: myAddress(),
      g: null, h: null, i: null, j: null, k: null, l: null
    };
  }
}
