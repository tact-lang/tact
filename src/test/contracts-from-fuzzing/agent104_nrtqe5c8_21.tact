struct First {
    a: Int;
}

struct Second {
    b: Int;
    c: First;
}

struct Third {
    d: Second;
    e: Int;
}

contract NestedMix {
    field: Third;
    init() {
        self.field = Third{
            d: Second{
                b: 45,
                c: First{a: 12},
            },
            e: 99,
        };
    }
}