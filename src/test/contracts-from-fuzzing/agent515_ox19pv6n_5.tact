struct Inner {
    a: Int = 1;
    b: Bool?;
}

struct Outer {
    foo: Int = 5;
    inner: Inner = Inner{};
}

contract Test {
    s: Outer = Outer{
        foo: 10,
        inner: Inner{
            a: 777
            // omit b, default null
        }
    };

    receive() {
        let _ = self.s.inner.a;
    }
}