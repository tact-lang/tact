struct Small { x: Int; }

struct Mid {
    a: Small?;
    b: Small?;
}

contract NestedOpts {
    data: Mid = Mid{
        a: null,
        b: null,
    };

    init() {
        self.data = Mid{
            a: Small{ x: 10 },
            b: Small{ x: 20 },
        };
    }
}