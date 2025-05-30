struct Complex {
  num: Int as int64;
  flag: Bool;
  label: String?;
  extra: Cell?;
}

contract ComplexPersistent {
  s1: Complex;
  s2: Complex;

  init() {
    self.s1 = Complex{num:123, flag:true, label:"X", extra:null};
    self.s2 = Complex{num:-456, flag:false, label:null, extra:emptyCell()};
  }
}