struct Inner {
  a: Int;
  b: Int?;
}

struct Outer {
  first: Int;
  nested: Inner;
  opt_nested: Inner?;
}

contract NestedOptionals {
  data: Outer;
  
  init() {
    self.data = Outer{
      first: 1,
      nested: Inner{ a: 2, b: 3 },
      opt_nested: null
    };
  }
}
