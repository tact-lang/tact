struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Int;
}

contract TestNested {
  receive() {
    let inner: Inner = Inner{ x: 10, y: 20 };
    let outer: Outer = Outer{ a: 1, b: inner, c: 3 };
    let val: Int = outer.b.y;
  }
}
