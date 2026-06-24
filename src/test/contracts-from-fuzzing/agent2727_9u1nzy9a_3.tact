struct LongList {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Address;
  f: Bool;
  g: Int;
  h: String;
  i: Slice;
  j: Cell;
}

contract LongListContract {
  data: LongList;

  init() {
    self.data = LongList{
      a: 1,
      b: true,
      c: "abc",
      d: emptyCell(),
      e: myAddress(),
      f: false,
      g: 42,
      h: "xyz",
      i: emptyCell().asSlice(),
      j: emptyCell()
    };
  }
}