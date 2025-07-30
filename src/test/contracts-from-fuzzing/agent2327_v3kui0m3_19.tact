struct Leaf1 { val: Int; }
struct Leaf2 { val: Int; }

struct Middle {
    l1: Leaf1;
    l2: Leaf2;
}

struct Root {
    mid: Middle;
}

contract ComplexNest {
    s: Root;

    init() {
        self.s = Root{
            mid: Middle{
                l1: Leaf1{ val: 1 },
                l2: Leaf2{ val: 2 }
            }
        };
    }
}
