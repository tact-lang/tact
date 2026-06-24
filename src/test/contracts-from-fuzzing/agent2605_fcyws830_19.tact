struct Mid {
    v1: Int;
    v2: Int;
}

struct Top {
    m: Mid;
    optM: Mid?;
}

contract NestedOptStruct {
    data: Top;

    init() {
        self.data = Top {
            m: Mid { v1: 1, v2: 2 },
            optM: null,
        };
    }
}
