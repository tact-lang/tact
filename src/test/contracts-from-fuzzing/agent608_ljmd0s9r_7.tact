struct NestedOptional {
  inner: Int?;
  name: String?;
}

struct Container {
  nested: NestedOptional;
  count: Int;
}

contract NestedOptionalTest {
  s: Container;

  init() {
    self.s = Container{
      nested: NestedOptional{ inner:null, name:null },
      count: 100
    };
  }
}
