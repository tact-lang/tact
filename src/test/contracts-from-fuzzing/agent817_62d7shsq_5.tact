struct Leaf1 { val: Int; }
struct Leaf2 { flag: Bool; }
struct Middle {
    l1: Leaf1;
    l2: Leaf2;
}

struct Root {
    m1: Middle;
    m2: Middle;
}

contract NestedTrees {
    tree: Root;

    init() {
        self.tree = Root{
            m1: Middle{
                l1: Leaf1{ val: 1 },
                l2: Leaf2{ flag: true },
            },
            m2: Middle{
                l1: Leaf1{ val: 2 },
                l2: Leaf2{ flag: false },
            },
        };
    }
}