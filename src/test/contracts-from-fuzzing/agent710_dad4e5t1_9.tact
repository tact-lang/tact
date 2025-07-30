struct InnerMost {
    p: Int;
    q: Bool;
}

struct InnerMid {
    f: Int;
    d1: InnerMost;
    d2: InnerMost?;
}

struct InnerTop {
    a: Bool;
    inner: InnerMid;
    name: String?;
}

contract TestContract {
    data: InnerTop = InnerTop{
        a: true,
        inner: InnerMid{
            f: 10,
            d1: InnerMost{ p: 1, q: false },
            d2: null
        },
        name: null
    };

    init() {
        self.data = InnerTop{
            a: false,
            inner: InnerMid{
                f: 20,
                d1: InnerMost{ p: 2, q: true },
                d2: InnerMost{ p: 3, q: false }
            },
            name: "Nested"
        };
    }
}