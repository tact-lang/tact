struct Inner {
    foo: Int = 99;
    bar: Bool?;
}

struct Outer {
    inner: Inner;
    x: Int = 7;
}

contract DefaultsEmbedded {
    s: Outer;

    init() {
        self.s = Outer{
            inner: Inner{}, // omit all optional/defaulted fields
            // x omitted, should default to 7
        };
    }
}