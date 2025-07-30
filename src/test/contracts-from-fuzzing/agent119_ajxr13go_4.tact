struct ManyFields {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Address;
  f5: Int?;
  f6: Bool?;
  f7: Cell;
  f8: Slice;
}

contract WideContract {
  big: ManyFields;

  init() {
    self.big = ManyFields{
      f1: 1,
      f2: true,
      f3: "hi",
      f4: myAddress(),
      f5: null,
      f6: null,
      f7: emptyCell(),
      f8: emptyCell().asSlice()
    };
  }
}