struct Inner {
  a: Int;
  b: Int;
}

struct Outer {
  foo: Int;
  bar: Bool;
  nested: Inner;
}

contract TestStorage {
  data: Outer;

  init() {
    self.data = Outer{
      foo: 7,
      bar: true,
      nested: Inner{a: 1, b: 2}
    };
  }
}
