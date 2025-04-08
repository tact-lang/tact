struct Inner {
  a: Int;
}

struct Outer {
  x: Int;
  y: Inner;
}

contract C {
  o: Outer = Outer{ x: 2, y: Inner{ a: 3 } };
}
