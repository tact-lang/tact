struct BigStruct {
  f01: Int;
  f02: Int?;
  f03: Bool;
  f04: Bool?;
  f05: Address;
  f06: Address?;
  f07: Cell;
  f08: Cell?;
  f09: Slice;
  f10: Slice?;
  f11: String;
  f12: String?;
}

contract Test {
  big: BigStruct;

  init() {
    self.big = BigStruct{
      f01: 0,
      f02: null,
      f03: false,
      f04: null,
      f05: myAddress(),
      f06: null,
      f07: emptyCell(),
      f08: null,
      f09: emptyCell().asSlice(),
      f10: null,
      f11: "hi",
      f12: null,
    };
  }
}