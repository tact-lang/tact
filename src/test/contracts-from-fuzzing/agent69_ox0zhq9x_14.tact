struct Complex {
    s1: Inner;
    s2: Inner;
    opt: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract ComplexStruct {
    data: Complex;

    init() {
        self.data = Complex{
            s1: Inner{ foo: 1, bar: true },
            s2: Inner{ foo: 2, bar: false },
            opt: null,
        };
    }
}
