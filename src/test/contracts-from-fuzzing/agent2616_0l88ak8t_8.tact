struct Mixed {
  i: Int;
  b: Bool;
  s: String;
  a: Address;
  oi: Int?;
  ob: Bool?;
  os: String?;
  oa: Address?;
}

contract MixedFields {
  mf: Mixed;

  init() {
    self.mf = Mixed{
      i: 42,
      b: true,
      s: "abc",
      a: myAddress(),
      oi: 7,
      ob: false,
      os: null,
      oa: null,
    };
  }
}