struct Leaf {
    f: Int?;
}

struct Mid {
    leaf: Leaf?;
}

struct Top {
    mid: Mid?;
}

contract OptChain {
    chain: Top;
    init() {
        self.chain = Top{
            mid: Mid{
                leaf: null,
            },
        };
    }
}