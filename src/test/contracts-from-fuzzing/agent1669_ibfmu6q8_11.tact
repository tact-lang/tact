struct InnerMost {
    y: Int;
}

struct Mid {
    z: InnerMost;
}

contract NestedNoDefaults {
    m: Mid;

    init() {
        self.m = Mid{
            z: InnerMost{ y: 999 },
        };
    }
}