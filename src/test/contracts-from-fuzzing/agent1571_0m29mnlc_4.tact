struct InnerMost {
    z: String;
}

struct Inner {
    a: Int;
    b: Bool;
    c: InnerMost;
    d: Int?;
}

contract TestContract {
    nested: Inner = Inner{
        a: 1,
        b: false,
        c: InnerMost{ z: "" },
        d: null,
    };

    init() {
        self.nested = Inner{
            a: 33,
            b: true,
            c: InnerMost{ z: "deep" },
            d: 12345,
        };
    }
}