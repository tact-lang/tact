struct ManyFields {
  f1: Int;
  f2: Bool;
  f3: Cell;
  f4: Slice;
  f5: Int?;
  f6: Bool?;
  f7: Cell;
  f8: String;
  f9: String;
  f10: Int;
}

contract TestContract {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      f1: 1,
      f2: true,
      f3: emptyCell(),
      f4: emptyCell().asSlice(),
      f5: null,
      f6: false,
      f7: emptyCell(),
      f8: "abc",
      f9: "def",
      f10: 123
    };
  }
}