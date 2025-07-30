struct Inner {
    foo: Bool;
    count: Int;
}

struct Outer {
    a: Bool;
    b: Inner;
    c: Int;
    d: Bool;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            a: true,
            b: Inner{
                foo: false,
                count: 42
            },
            c: 99,
            d: false
        };
    }
}