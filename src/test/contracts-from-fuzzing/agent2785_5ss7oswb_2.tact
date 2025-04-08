struct Outer {
    a: Int;
    inner: Inner;
}

struct Inner {
    b: Bool;
    s: String;
    optI: Int?;
}

contract Test(
    o: Outer,
) {
    receive() {
        let _ = self.o.inner.b;
    }
}
