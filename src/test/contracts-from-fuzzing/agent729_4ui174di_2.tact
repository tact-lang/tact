struct DeepNested {
  n1: Int;
  s1: String;
  optInner: Inner?;
}

struct Inner {
  a: Int;
  b: String?;
  c: Cell;
}

contract DeepContract {
  deepField: DeepNested;

  init() {
    self.deepField = DeepNested{
      n1: 42,
      s1: "hello",
      optInner: Inner{a: 1, b: null, c: emptyCell()}
    };
  }
}
