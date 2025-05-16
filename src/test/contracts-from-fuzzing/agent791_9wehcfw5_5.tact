struct Mixed {
  i: Int;
  b: Bool;
  s: String;
  c: Cell;
  slice: Slice;
  addr: Address;
}

contract MixedContract {
  m: Mixed;

  init() {
    self.m = Mixed{
      i: 11,
      b: true,
      s: "hello",
      c: emptyCell(),
      slice: emptyCell().asSlice(),
      addr: myAddress()
    };
  }
}