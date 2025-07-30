struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    b: Int;
}

contract TestContract {
    data: Outer = Outer{
        inner: Inner{ a: 5 },
        b: 10,
    };

    init() {}
}