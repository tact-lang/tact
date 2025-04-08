struct Leaf {
    x: Int;
}

struct Middle {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Top {
    mid1: Middle;
    mid2: Middle;
    mid3: Middle;
}

contract TreeBig {
    data: Top;

    init() {
        self.data = Top{
            mid1: Middle{ leaf1: Leaf{ x: 1 }, leaf2: Leaf{ x: 2 } },
            mid2: Middle{ leaf1: Leaf{ x: 3 }, leaf2: Leaf{ x: 4 } },
            mid3: Middle{ leaf1: Leaf{ x: 5 }, leaf2: Leaf{ x: 6 } }
        };
    }
}