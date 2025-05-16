struct Nested {
  innermost: String;
}

struct Middle {
  nested: Nested;
}

struct Outer {
  m: Middle;
}

contract Deep {
  field: Outer;

  init() {
    self.field = Outer{m: Middle{nested: Nested{innermost: "hi"}}};
  }
}