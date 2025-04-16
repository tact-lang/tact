struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

struct Outer {
    d: Int;
    inner: Inner;
}

contract NestedStorage {
    state: Outer;

    init() {
        self.state = Outer {
            d: 777,
            inner: Inner {
                a: 1,
                b: false,
                c: null,
            },
        };
    }
}