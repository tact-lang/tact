struct Leaf {
    value: Int;
}

struct Mid {
    lf1: Leaf;
    lf2: Leaf;
}

struct Root {
    m1: Mid;
    m2: Mid;
}

contract BinaryTreeContract {
    tree: Root;
    init() {
        self.tree = Root{
            m1: Mid{lf1: Leaf{value:1}, lf2: Leaf{value:2}},
            m2: Mid{lf1: Leaf{value:3}, lf2: Leaf{value:4}},
        };
    }
}