struct ManyFields {
  f0: Int;
  f1: Bool;
  f2: String;
  f3: Address;
  f4: Slice;
  f5: Builder;
  f6: Cell;
  f7: Int?;
  f8: Bool?;
  f9: String?;
}

contract TestContract {
  data: ManyFields;

  init() {
    self.data = ManyFields {
      f0: 1,
      f1: true,
      f2: "abc",
      f3: myAddress(),
      f4: emptyCell().asSlice(),
      f5: beginCell(),
      f6: emptyCell(),
      f7: null,
      f8: false,
      f9: null,
    };
  }
}