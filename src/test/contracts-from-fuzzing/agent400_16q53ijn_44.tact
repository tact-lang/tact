// deeply nested mixed type optional struct
struct InnerMost {
  foo: Int;
}

struct Mid {
  x: InnerMost?;
  y: Bool?;
}

struct Outer {
  z: Int?;
  w: Mid?;
}

contract ComplexNestedOptionals {
  val: Outer = Outer {
    z: null,
    w: null
  };
  init() {}
}