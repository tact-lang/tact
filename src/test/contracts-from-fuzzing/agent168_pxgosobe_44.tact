struct Nested {
  x: Int;
}

struct Outer {
  n: Nested;
}

contract TestOptOuter {
  val: Outer?;
}
