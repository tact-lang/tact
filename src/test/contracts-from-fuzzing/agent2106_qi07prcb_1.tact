struct InnerNested {
    a: Int;
    b: Bool;
}

struct OuterNested {
    inner: InnerNested;
    c: Int?;
}

contract TestPersistence {
    data: OuterNested;

    init() {
        self.data = OuterNested {
            inner: InnerNested {
                a: 10,
                b: true,
            },
            c: 20,
        };
    }
}