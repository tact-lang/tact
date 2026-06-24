// Nested struct chain with optional at multiple depths
struct Leaf {
    payload: Int?;
}

struct Mid {
    leaf: Leaf?;
}

struct Top {
    mid: Mid?;
}

contract OptChain {
    root: Top;

    init() {
        self.root = Top{
            mid: Mid{
                leaf: Leaf{payload: null}
            }
        };
    }
}