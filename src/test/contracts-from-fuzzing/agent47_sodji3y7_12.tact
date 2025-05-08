struct Inner {
    foo: Int = 7;
    bar: Bool?;
}

struct Outer {
    inner: Inner;
    zed: Int;
}

contract TestContract {
    stored: Outer;

    init() {
        self.stored = Outer{
            inner: Inner{ bar: null },
            zed: 99
        };
    }
}