// Nested optional structs with default values and multiple nullable
struct Inner {
  x: Int = 1;
  y: Bool?;
}

struct Outer {
  inner: Inner?;
  label: String?;
}

contract NestedValsOptionals {
  data: Outer?;

  init() {
    self.data = Outer{
      inner: null,
      label: null,
    };
  }
}