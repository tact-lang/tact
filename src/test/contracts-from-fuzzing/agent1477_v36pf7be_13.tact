struct BooleanStruct {
  f1: Bool;
  f2: Bool;
  f3: Bool;
  f4: Bool;
  f5: Bool;
  f6: Bool;
  f7: Bool;
  f8: Bool;
  f9: Bool;
  f10: Bool;
}

contract PackedBools {
  bs: BooleanStruct;

  init() {
    self.bs = BooleanStruct{
      f1: true, f2: false, f3: true, f4: false, f5: true,
      f6: false, f7: true, f8: false, f9: true, f10: false,
    };
  }
}