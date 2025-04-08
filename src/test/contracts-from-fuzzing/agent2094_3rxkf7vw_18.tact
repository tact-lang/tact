struct Inner {
    x: Int = 1;
    y: String?;
}

struct Outer {
    foo: Bool = false;
    inner: Inner;
}

contract ComplexDefaults {
    data: Outer = Outer{
        foo: true,
        inner: Inner{ y: null }
    };
    receive() {}
}
