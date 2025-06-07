struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  i: Int;
  nested: Inner;
}

contract Test(
  param: Outer,
) {}