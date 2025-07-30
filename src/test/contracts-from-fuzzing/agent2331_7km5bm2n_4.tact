struct DeepNested {
  inner: Inner;
  flag: Bool;
}

struct Inner {
  x: Int;
  y: String;
}

contract Test {
  nested: DeepNested;
  init() {
    self.nested = DeepNested{
      inner: Inner{x: 7, y: "hi"},
      flag: false
    };
  }
}