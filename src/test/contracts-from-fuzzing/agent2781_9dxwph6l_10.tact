struct Inner {
  p: Int?;
  q: Bool;
}

struct Outer {
  x: Int;
  y: Inner?;
}

contract Test(
  bigParam: Outer,
) {}