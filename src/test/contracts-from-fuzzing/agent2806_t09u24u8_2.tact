struct Inner {
  x: Int;
  y: Bool;
}

struct Outer {
  foo: Inner;
  bar: String;
}

contract DeepNested {
  storage: Outer;

  init() {
    self.storage = Outer{
      foo: Inner{x: 123, y: false},
      bar: "test"
    };
  }
}