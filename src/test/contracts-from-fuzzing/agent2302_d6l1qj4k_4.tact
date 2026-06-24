struct ManyFields {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Int?;
  f5: Bool;
  f6: String;
  f7: Int;
  f8: String;
  f9: Int?;
  f10: Bool;
}

contract FieldCount {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      f1: 1,
      f2: true,
      f3: "a",
      f4: null,
      f5: false,
      f6: "b",
      f7: 7,
      f8: "c",
      f9: null,
      f10: true
    };
  }
}
