struct Inner {
    a: Int;
    b: Bool?;
}

struct Mid {
    inner: Inner;
    extra: String;
    opt: Int?;
}

struct Outer {
    mid: Mid;
    flag: Bool;
}

contract ComplexContract {
    store: Outer = Outer{
        mid: Mid{
            inner: Inner{ a: 0, b: null },
            extra: "hi",
            opt: null
        },
        flag: true
    };

    init() {
        self.store = Outer{
            mid: Mid{
                inner: Inner{ a: 123, b: true },
                extra: "bye",
                opt: 1000
            },
            flag: false
        };
    }
}