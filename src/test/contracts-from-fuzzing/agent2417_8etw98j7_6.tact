struct One {
    i: Int;
}

struct Two {
    a: One;
    b: One;
}

contract StructOfStructs {
    s: Two;

    init() {
        self.s = Two{
            a: One{ i: 1 },
            b: One{ i: 2 }
        };
    }
}
