struct ManyFields {
  f1: Int;
  f2: Bool;
  f3: Int;
  f4: Bool;
  f5: String;
  f6: Int?;
  f7: Bool?;
  f8: String;
  f9: Bool;
  f10: Int;
}

contract TestContract {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      f1: 1,
      f2: false,
      f3: 3,
      f4: true,
      f5: "abc",
      f6: null,
      f7: null,
      f8: "def",
      f9: true,
      f10: 10,
    };
  }
}