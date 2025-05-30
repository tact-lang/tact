struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    c: Int;
}

contract TestContract {
    receive() {
        let o: Outer = Outer{
            inner: Inner{ a: 10, b: 20 },
            c: 30
        };
    }
}
