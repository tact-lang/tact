struct BigStruct {
  f0: Int;
  f1: Bool;
  f2: Address;
  f3: Cell;
  f4: Slice;
  f5: String;
  f6: Int?;
  f7: Bool?;
  f8: Address;
  f9: Cell;
  f10: Slice;
  f11: String;
}

contract StructField {
  data: BigStruct;

  init() {
    self.data = BigStruct{
      f0: 1, f1: true, f2: myAddress(), f3: emptyCell(), f4: emptyCell().asSlice(), f5: "hi",
      f6: 7, f7: false, f8: myAddress(), f9: emptyCell(), f10: emptyCell().asSlice(), f11: "bye"
    };
  }
}
