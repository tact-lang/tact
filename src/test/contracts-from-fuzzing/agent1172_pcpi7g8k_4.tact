struct ManyFields {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Cell;
  f5: Slice;
  f6: Builder;
  f7: Int?;
  f8: Bool?;
  f9: String?;
  f10: Cell;
  f11: Slice;
  f12: Builder;
}

contract LargeStorage {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      f1: 1,
      f2: false,
      f3: "hi",
      f4: emptyCell(),
      f5: beginCell().endCell().asSlice(),
      f6: beginCell(),
      f7: null,
      f8: true,
      f9: null,
      f10: emptyCell(),
      f11: beginCell().endCell().asSlice(),
      f12: beginCell()
    };
  }
}