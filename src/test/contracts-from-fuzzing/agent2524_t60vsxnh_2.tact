struct Inner {
  x: Int;
  y: Int;
}

struct Outer {
  inner: Inner?;
}

contract OptNested {
  outer: Outer?;
}