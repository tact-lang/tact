struct Inner {
    value: Int;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
}

contract MultiNested {
    storage: Outer;

    init() {
        self.storage = Outer{
            a: Inner{ value: 10 },
            b: Inner{ value: 20 },
            c: Inner{ value: 30 },
        };
    }
}