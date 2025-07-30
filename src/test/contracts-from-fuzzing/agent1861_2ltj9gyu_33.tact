struct Mid {
    x: Int;
}

struct Top {
    f1: Int;
    nested: Mid;
    f2: Int;
}

contract NestedMiddle {
    storage: Top;

    init() {
        self.storage = Top{
            f1: 1,
            nested: Mid{ x: 42 },
            f2: 2
        };
    }
}