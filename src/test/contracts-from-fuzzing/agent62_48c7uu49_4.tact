struct Big {
  a: Int;
  b: Int as uint8;
  c: Bool;
  d: Bool?;
  e: String;
  f: Address;
  g: Slice;
  h: Cell;
  i: Int?;
  j: Bool;
  k: Int as int16;
  l: Int as uint32;
  m: Int as int1;
  n: Bool?;
  o: Int?; 
}

contract Test4 {
  field: Big;
  init() {
    self.field = Big{
      a: 1,
      b: 2,
      c: true,
      d: false,
      e: "x",
      f: myAddress(),
      g: emptyCell().asSlice(),
      h: emptyCell(),
      i: null,
      j: true,
      k: -7,
      l: 1000,
      m: 1,
      n: true,
      o: null
    };
  }
}