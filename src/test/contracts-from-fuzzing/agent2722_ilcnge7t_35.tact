struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    c: String;
    d: Bool?;
}

contract TestContract {
    data: Outer = Outer {
        nested: Inner { a: 5, b: false },
        c: "abc",
        d: null
    };

    init() {
        self.data = Outer {
            nested: Inner { a: 42, b: true },
            c: "zzz",
            d: true
        };
    }
}