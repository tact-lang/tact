struct MultType {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Address;
  f: Slice;
}

contract MultiTypeContract {
  store: MultType;

  init() {
    self.store = MultType{
      a: 1,
      b: false,
      c: "abc",
      d: emptyCell(),
      e: myAddress(),
      f: emptyCell().asSlice()
    };
  }
}