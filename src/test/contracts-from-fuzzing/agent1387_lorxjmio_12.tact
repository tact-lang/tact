struct VariousPrim {
  x: Int;
  b: Bool;
  addr: Address;
  str: String;
  cellVal: Cell;
  sliceVal: Slice;
}

contract TestContract {
  data: VariousPrim;

  init() {
    self.data = VariousPrim{
      x: 7,
      b: true,
      addr: myAddress(),
      str: "hi",
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice()
    };
  }
}