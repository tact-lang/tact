struct Inner {
  a: Int;
  b: Bool?;
}

struct Outer {
  nested: Inner;
  flag: Bool;
}

contract DeepNested {
  data: Outer;

  init() {
    self.data = Outer{
      nested: Inner{ a: 10, b: true },
      flag: false
    };
  }
}