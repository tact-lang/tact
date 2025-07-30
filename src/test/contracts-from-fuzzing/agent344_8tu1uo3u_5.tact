struct Inner {
  x: Int;
}

struct Outer {
  inner: Inner;
  flag: Bool;
}

contract MultiNested {
  outer1: Outer = Outer{ inner: Inner{ x: 10 }, flag: true };
  outer2: Outer = Outer{ inner: Inner{ x: 20 }, flag: false };
}