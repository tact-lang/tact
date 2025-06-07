struct Leaf {
    val: Int;
    optVal: Int?;
}

struct Mid {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Top {
    mid1: Mid;
    mid2: Mid;
}

contract NestedFields {
    state: Top;

    init() {
        self.state = Top{
            mid1: Mid{
                leaf1: Leaf{ val: 1, optVal: null },
                leaf2: Leaf{ val: 2, optVal: null },
            },
            mid2: Mid{
                leaf1: Leaf{ val: 3, optVal: null },
                leaf2: Leaf{ val: 4, optVal: null },
            }
        };
    }
}