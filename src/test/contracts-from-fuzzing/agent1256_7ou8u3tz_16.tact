struct Leaf {
    v: Int = 7;
}

struct Mid {
    leaf: Leaf;
}

struct RootLayer {
    mid1: Mid;
    mid2: Mid;
}

contract NestedOnlyStructs {
    s: RootLayer;

    init() {
        self.s = RootLayer{
            mid1: Mid{ leaf: Leaf{} },
            mid2: Mid{ leaf: Leaf{} },
        };
    }
}