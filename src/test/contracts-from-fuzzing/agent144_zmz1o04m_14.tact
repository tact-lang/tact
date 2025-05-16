struct Leaf {
    n: Int as uint8;
}

struct Mid {
    leaf: Leaf?;
}

contract OptSerLimits {
    data: Mid?;
    init() {
        self.data = Mid{
            leaf: Leaf{n: -10}
        };
    }
}