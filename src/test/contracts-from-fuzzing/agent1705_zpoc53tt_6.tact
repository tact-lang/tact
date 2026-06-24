struct BigStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Int?;
  h: Bool?;
  i: Cell?;
  j: Slice?;
}

contract BigFieldsTest {
  s: BigStruct;

  init() {
    self.s = BigStruct{
      a:1,
      b:true,
      c:"hi",
      d:myAddress(),
      e:emptyCell(),
      f:emptyCell().asSlice(),
      g:null,
      h:null,
      i:null,
      j:null,
    };
  }
}