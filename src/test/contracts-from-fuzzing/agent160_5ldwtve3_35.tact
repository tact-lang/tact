struct Leaf {
    value: Int;
}

struct Mid {
    nested: Leaf?;
}

struct Top {
    m: Mid? = Mid{ nested: null };
}

contract TestDefOptChain {
    s: Top;
    init() {
        self.s = Top{};
    }
}