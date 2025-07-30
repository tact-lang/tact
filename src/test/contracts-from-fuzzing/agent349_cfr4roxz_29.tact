// Struct with a nested struct with an optional struct
struct Inner {
  num: Int;
}

struct Mid {
  val: Int;
  opt: Inner?;
}

struct Outer {
  inside: Mid;
}

contract NestedOptionalLast {
  payload: Outer;
  init() {
    self.payload = Outer{ inside: Mid{ val: 99, opt: null } };
  }
}