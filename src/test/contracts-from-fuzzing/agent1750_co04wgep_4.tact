struct Inner {
    x: Int?;
    y: Bool;
}

struct Outer {
    foo: Inner;
    bar: String?;
}

contract TestContract {
    st: Outer = Outer{
        foo: Inner{
            x: null,
            y: true,
        },
        bar: null,
    };

    init() {}
}