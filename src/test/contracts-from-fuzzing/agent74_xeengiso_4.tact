struct ManyFields {
  f1: Int;
  f2: Bool;
  f3: Bool?;
  f4: String;
  f5: Int;
  f6: Bool;
  f7: Bool?;
  f8: String;
  f9: Int;
  f10: Bool;
}

contract TestContract {
  data: ManyFields;
  init() {
    self.data = ManyFields{
      f1: 1, f2: false, f3: null, f4: "a",
      f5: 5, f6: true, f7: null, f8: "b",
      f9: 9, f10: true
    };
  }
}