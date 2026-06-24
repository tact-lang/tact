struct DeepWrap {
  i: Int;
  s: String;
  b: Bool;
}

struct ContainsNested {
  f: DeepWrap;
  opt: Int?;
}

contract Compose {
  inner: ContainsNested;

  init() {
    self.inner = ContainsNested{
      f: DeepWrap{ i: 55, s: "ok", b: true },
      opt: null
    };
  }
}