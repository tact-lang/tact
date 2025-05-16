struct LongStruct {
  i1: Int;
  b1: Bool;
  s1: String;
  optI: Int?;
  optB: Bool?;
  s2: String;
  i2: Int;
  b2: Bool;
  s3: String;
}

contract ManyFields {
  big: LongStruct;

  init() {
    self.big = LongStruct{
      i1: 1,
      b1: true,
      s1: "abc",
      optI: null,
      optB: false,
      s2: "def",
      i2: 2,
      b2: false,
      s3: "ghi",
    };
  }
}