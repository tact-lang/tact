struct MultiTypes {
  a: Int;
  b: String;
  c: Bool;
  d: Cell;
  e: Address;
  f: Slice;
  g: Builder;
}

contract TestContract {
  testField: MultiTypes;
  init() {
    self.testField = MultiTypes{
      a: 1,
      b: "b",
      c: false,
      d: emptyCell(),
      e: myAddress(),
      f: emptyCell().asSlice(),
      g: beginCell()
    };
  }
}