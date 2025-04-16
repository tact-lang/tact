/// Test case 2: Simple Nested Structs
struct Inner {
    A: Int;
    B: Int
}

struct Outer {
    inner: Inner
}

contract TestNested {
    receive(msg: Slice) {
        let o: Outer = Outer { inner: Inner { A: 10, B: 15 } };
        dump(o.inner.A + o.inner.B); // Expected output: 25
    }
}
