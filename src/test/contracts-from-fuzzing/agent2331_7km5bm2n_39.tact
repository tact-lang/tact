struct Mix {
  i: Int;
  s: String;
  b: Bool;
  addr: Address;
  cell: Cell;
  sl: Slice;
  bu: Builder;
}

contract Test {
  mix: Mix;
  init() {
    self.mix = Mix{
      i: 7,
      s: "hello",
      b: false,
      addr: myAddress(),
      cell: emptyCell(),
      sl: emptyCell().asSlice(),
      bu: beginCell()
    };
  }
}