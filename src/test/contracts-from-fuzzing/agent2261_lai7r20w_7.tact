struct MixedNested {
  smallOpt: Int? as int8;
  bigOpt: Int?;
  flag: Bool;
}

contract MixedComplex {
  a: Int as uint16 = 42;
  b: Int? = null;
  c: Bool?;
  nested: MixedNested;

  init() {
    self.a = 100;
    self.b = null;
    self.c = null;
    self.nested = MixedNested {
      smallOpt: null,
      bigOpt: null,
      flag: false
    };
  }
}