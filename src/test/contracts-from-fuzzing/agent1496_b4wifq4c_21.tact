struct StrBoolInt {
  s: String;
  b: Bool;
  i: Int;
}

contract PersistCombo {
  f1: StrBoolInt;
  f2: StrBoolInt;

  init() {
    self.f1 = StrBoolInt{s:"x",b:true,i:1};
    self.f2 = StrBoolInt{s:"y",b:false,i:2};
  }
}