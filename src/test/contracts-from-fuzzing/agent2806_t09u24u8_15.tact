struct ManyMixed {
  i: Int = 5;
  b: Bool?;
  s: String?;
  nested: NestedDefOpt?;
}

struct NestedDefOpt {
  flag: Bool = false;
  txt: String?;
}

contract MixedStructs {
  ms: ManyMixed;

  init() {
    self.ms = ManyMixed{
      b: null,
      s: null,
      nested: NestedDefOpt{txt: "ok"},
      i: 7
    };
  }
}