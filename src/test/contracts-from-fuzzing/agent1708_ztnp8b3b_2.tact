struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    a: Inner;
    b: Int?;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer {
            a: Inner {
                foo: null,
                bar: null
            },
            b: null
        };
    }
}
