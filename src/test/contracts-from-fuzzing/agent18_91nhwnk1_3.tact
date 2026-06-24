struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    extra: Int;
}

contract TestContract {
    receive() {
        // Instantiate Outer with a nested Inner struct
        let o = Outer{
            inner: Inner{ a: 100, b: 200 },
            extra: 300
        };
        // Access a nested field to ensure proper type resolution
        let x = o.inner.a;
    }
}
