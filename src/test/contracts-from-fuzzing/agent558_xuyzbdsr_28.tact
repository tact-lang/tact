// deeply nested struct, partial defaults
struct Base {
  a: Int = 1;
  b: Int;
}

struct Mid {
  x: Base;
}

contract Test {
  val: Mid = Mid{ x: Base{ b: 42 } };
}