struct DeepNested {
  foo: Int;
  bar: Bool;
  child: Inner;
}

struct Inner {
  x: Int;
  y: Bool;
}

contract DeepTest {
  nested: DeepNested;

  init() {
    self.nested = DeepNested{ foo: 3, bar: true, child: Inner{ x: 4, y: false } };
  }
}
