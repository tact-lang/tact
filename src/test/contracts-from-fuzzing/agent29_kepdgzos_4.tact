struct ManyFields {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Bool?;
  f5: Int?;
  f6: String?;
  f7: Bool;
  f8: Int;
  f9: String;
  f10: Bool;
  f11: Int;
  f12: String;
}

contract LotsOfFields {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      f1: 1,
      f2: false,
      f3: "hi",
      f4: null,
      f5: null,
      f6: null,
      f7: true,
      f8: 2,
      f9: "bye",
      f10: true,
      f11: 3,
      f12: "end",
    };
  }
}