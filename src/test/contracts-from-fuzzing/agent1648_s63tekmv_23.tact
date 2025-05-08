// multiple nested structs with optional middle layer

struct Top {
    mid: Mid?;
    var2: Int;
}

struct Mid {
    low: Low;
}

struct Low {
    value: Int;
}

contract TestContract {
    s: Top;
    init() {
        self.s = Top {
            mid: Mid{ low: Low{ value: 123 } },
            var2: 456
        };
    }
}