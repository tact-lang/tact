struct Outer {
    inner: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract ChangeOrder {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ foo: 10, bar: false },
        };
    }
}