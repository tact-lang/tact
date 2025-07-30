struct Inner {
  a: Int;
  b: Int;
}

struct Outer {
  inner: Inner;
  x: Int;
}

contract TestNested {
  receive() {
    let o: Outer = Outer{
      inner: Inner{ a: 42, b: 24 },
      x: 100
    };
  }
}
