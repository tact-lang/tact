struct DeepNested {
  x: Int;
  y: Int?;
  z: Inner;
}

struct Inner {
  foo: Int;
  bar: Int?;
  baz: Deeper;
}

struct Deeper {
  a: Bool;
  b: Int?;
}

contract NestedTest {
  val: DeepNested;
  
  init() {
    self.val = DeepNested{
      x: 1,
      y: null,
      z: Inner{
        foo: 2,
        bar: null,
        baz: Deeper{a: true, b: 42}
      }
    };
  }
}