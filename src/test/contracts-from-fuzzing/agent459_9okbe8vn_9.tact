struct ManyFields {
  a: Int;
  b: Bool;
  c: Int?;
  d: String;
  e: String?;
  f: Cell;
  g: Slice;
  h: Address;
  i: Bool?;
  j: Address?;
}

contract ManyFieldsStorage {
  m: ManyFields;

  init() {
    self.m = ManyFields{
      a:1,
      b:false,
      c:null,
      d:"hi",
      e:null,
      f:emptyCell(),
      g:emptyCell().asSlice(),
      h:myAddress(),
      i:null,
      j:null
    };
  }
}