struct Inner {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
    addr: Address? = null;
}

struct Outer {
    inner: Inner;
    extra: Int = 5;
}

contract TestOptDefaultsOmitted {
    storage: Outer = Outer{
        inner: Inner{}, // omit all optional fields
        extra: 10
    };

    init() {}
}