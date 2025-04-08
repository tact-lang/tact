struct LargeFields {
  f1: Int;
  f2: Int;
  f3: Bool;
  f4: Int;
  f5: Bool?;
  f6: Int;
  f7: Bool;
  f8: Int?;
  f9: Bool;
  f10: Int;
}

contract TestContract {
  data: LargeFields;

  init() {
    self.data = LargeFields{
      f1: 1, f2: 2, f3: false, f4: 4, f5: null,
      f6: 6, f7: true, f8: null, f9: true, f10: 10
    };
  }
}