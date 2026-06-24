// Struct with nested fields plus optionals and mixed types
struct Sub {
  x: Int;
  y: String?;
}

struct Container {
  a: Bool;
  b: Sub;
  c: Int?;
}

contract MixedNestedOpts {
  data: Container;

  init() {
    self.data = Container{
      a: false,
      b: Sub{
        x: 7,
        y: "test"
      },
      c: null
    };
  }
}