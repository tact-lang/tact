struct StrBool {
  s: String;
  b: Bool;
}

struct IntOpt {
  a: Int;
  o: Int?;
}

contract MixDefault {
  ab: StrBool = StrBool{ s: "x", b: false };
  inopt: IntOpt;

  init() {
    self.inopt = IntOpt{ a: 42, o: null };
  }
}