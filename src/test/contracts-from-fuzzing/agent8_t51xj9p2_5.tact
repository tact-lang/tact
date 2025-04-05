struct Inner {
    A: Int;
    B: Int;
}

struct Outer {
    inner: Inner;
    C: Int;
}

contract TestNested {
    receive() {
        let o: Outer = Outer {
            inner: Inner { A: 10, B: 20 },
            C: 30
        };
    }
}
