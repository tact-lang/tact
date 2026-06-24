struct DeepNested {
  s: String;
  inner: InnerDeep;
}

struct InnerDeep {
  flag: Bool;
  data: InnerMost;
}

struct InnerMost {
  value: Int;
}

contract Test3 {
  field: DeepNested;

  init() {
    self.field = DeepNested{
      s: "hey",
      inner: InnerDeep{flag: true, data: InnerMost{value: 42}}
    };
  }
}