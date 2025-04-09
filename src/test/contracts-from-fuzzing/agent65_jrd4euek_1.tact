struct ManyFields {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Cell;
  f5: Address;
  f6: Slice;
  f7: Builder;
  f8: String;
  f9: Int;
  f10: Bool;
}

contract Test {
  data: ManyFields;
  init() {
    self.data = ManyFields{
      f1: 1,
      f2: true,
      f3: "a",
      f4: emptyCell(),
      f5: myAddress(),
      f6: emptyCell().asSlice(),
      f7: beginCell(),
      f8: "b",
      f9: 9,
      f10: false
    };
  }
}