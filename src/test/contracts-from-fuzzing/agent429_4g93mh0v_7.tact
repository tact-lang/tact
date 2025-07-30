struct Inner {
  foo: Int;
}

struct Outer {
  nested: Inner?;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      nested: null
    };
  }
}