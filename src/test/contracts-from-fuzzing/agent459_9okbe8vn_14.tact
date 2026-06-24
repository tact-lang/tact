struct DeepNestedOpt {
  a: Int?;
  b: Int?;
}

struct MidNested {
  c: DeepNestedOpt;
  d: Bool?;
}

contract NestedOptFields {
  s: MidNested;

  init() {
    self.s = MidNested{
      c: DeepNestedOpt{ a:null, b:null },
      d: null
    };
  }
}