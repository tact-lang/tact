struct Leaf {
    v1: Int;
    v2: Bool;
}

struct Middle {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Root {
    mid1: Middle;
    mid2: Middle;
}

contract DoubleTree {
    val: Root;

    init() {
        self.val = Root{
            mid1: Middle{
                leaf1: Leaf{ v1: 0, v2: true },
                leaf2: Leaf{ v1: 1, v2: false },
            },
            mid2: Middle{
                leaf1: Leaf{ v1: 2, v2: true },
                leaf2: Leaf{ v1: 3, v2: false },
            },
        };
    }
}
