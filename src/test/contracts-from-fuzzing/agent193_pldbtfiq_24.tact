struct Leaf {
    a: Int;
}

struct Siblings {
    l1: Leaf;
    l2: Leaf;
    l3: Leaf;
}

contract WithSiblings {
    sibs: Siblings;

    init() {
        self.sibs = Siblings{
            l1: Leaf{a:1}, l2: Leaf{a:2}, l3: Leaf{a:3}
        };
    }
}