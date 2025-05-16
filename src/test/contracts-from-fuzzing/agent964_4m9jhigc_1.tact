struct BigStruct {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Int?;
  f5: Bool?;
  f6: String?;
  f7: Cell;
  f8: Slice;
  f9: Address;
  f10: Int;
  f11: Bool;
  f12: String;
}

contract LargeFields {
  payload: BigStruct;

  init() {
    self.payload = BigStruct {
      f1: 1,
      f2: true,
      f3: "a",
      f4: 2,
      f5: false,
      f6: "b",
      f7: emptyCell(),
      f8: emptyCell().asSlice(),
      f9: myAddress(),
      f10: 10,
      f11: false,
      f12: "done"
    };
  }
}
