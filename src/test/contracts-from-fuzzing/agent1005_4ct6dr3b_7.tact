struct BigList {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Address;
  f5: Int?;
  f6: Bool?;
  f7: String?;
  f8: Cell;
  f9: Slice;
  f10: Address?;
}

contract TestBigParam {
  big: BigList;

  init() {
    self.big = BigList{
      f1: 1, f2: true, f3: "s", f4: myAddress(), f5: null, f6: false,
      f7: null, f8: emptyCell(), f9: emptyCell().asSlice(), f10: null
    };
  }
}