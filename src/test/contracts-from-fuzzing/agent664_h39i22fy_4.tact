struct OptionalStruct {
  foo: Int?;
  bar: Bool?;
}

struct Container {
  nested: OptionalStruct?;
}

contract Test {
  data: Container;

  init() {
    self.data = Container{
      nested: null,
    };
  }
}