struct One {
    x: Int;
}

struct Two {
    a: One;
    b: One;
}

contract MultiSameNested {
    pair: Two;

    init() {
        self.pair = Two{
            a: One{ x: 11 },
            b: One{ x: 22 }
        };
    }
}