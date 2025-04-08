struct Large {
  a: Int;
  b: Bool;
  c: Int?;
  d: String;
  e: Bool?;
  f: Cell;
  g: Slice;
  h: Bool;
  i: Int;
  j: String?;
  k: Address;
  l: Address?;
}

contract TestContract {
  state: Large;

  init() {
    self.state = Large{
      a: 1,
      b: true,
      c: null,
      d: "test",
      e: false,
      f: emptyCell(),
      g: emptyCell().asSlice(),
      h: true,
      i: 2,
      j: null,
      k: myAddress(),
      l: null
    };
  }
}