// Persistent struct with nested multiple levels and mix of optionals
struct Innermost {
  foo: Int;
  bar: Bool?;
}

struct Middle {
  baz: Innermost;
  qux: String?;
}

struct Outer {
  x: Int;
  y: Middle?;
}

contract MixedNestedOptionals {
  store: Outer;

  init() {
    self.store = Outer{
      x: 100,
      y: Middle{
        baz: Innermost{
          foo: 7,
          bar: null
        },
        qux: "sample"
      }
    };
  }
}
