struct Leaf {
    value: Int;
}

struct Mid {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Top {
    mid1: Mid;
    optMid: Mid?;
}

contract NestedOptionals {
    data: Top;
    init() {
        self.data = Top{
            mid1: Mid{ leaf1: Leaf{value:1}, leaf2: Leaf{value:2} },
            optMid: null
        };
    }
}