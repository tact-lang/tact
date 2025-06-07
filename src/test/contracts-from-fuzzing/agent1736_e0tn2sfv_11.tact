struct Leaf {
    comment: String;
    val: Int;
}

struct Middle {
    left: Leaf;
    right: Leaf;
}

struct Top {
    a: Middle;
    b: Middle;
}

contract QuadTree {
    root: Top;
    init() {
        self.root = Top{
            a: Middle{
                left: Leaf{ comment: "L1", val: 1 },
                right: Leaf{ comment: "R1", val: 2 }
            },
            b: Middle{
                left: Leaf{ comment: "L2", val: 3 },
                right: Leaf{ comment: "R2", val: 4 }
            }
        };
    }
}