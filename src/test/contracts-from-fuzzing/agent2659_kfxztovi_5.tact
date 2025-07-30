struct InnerNested {
    value: Int;
}

struct MiddleNested {
    a: InnerNested;
    b: InnerNested;
}

struct OuterNested {
    first: MiddleNested;
    second: MiddleNested;
}

contract MultiNested {
    storage: OuterNested;

    init() {
        self.storage = OuterNested{
            first: MiddleNested{
                a: InnerNested{ value: 11 },
                b: InnerNested{ value: 22 },
            },
            second: MiddleNested{
                a: InnerNested{ value: 33 },
                b: InnerNested{ value: 44 },
            }
        };
    }
}