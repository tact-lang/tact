struct SInner {
  i: Int;
  s: String?;
}

struct SOuter {
  field1: SInner;
  field2: SInner;
  message: String;
}

contract NestedOpts {
  st: SOuter;

  init() {
    self.st = SOuter{
      field1: SInner{ i: 10, s: null },
      field2: SInner{ i: 20, s: "hi" },
      message: "hello",
    };
  }
}
