struct Inner {
    A: Int;
    B: Int;
    C: Int;
}

struct Outer {
    inner: Inner;
    X: Int;
    Y: Int;
}

contract TestNestedStruct {
    receive() {
        let innerInst: Inner = Inner { A: 10, B: 20, C: 30 };
        let outerInst: Outer = Outer { inner: innerInst, X: 100, Y: 200 };
        let _ = outerInst.inner.A + outerInst.X; // use fields
    }
}
