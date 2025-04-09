struct Leaf {
    v: Int;
}

struct Mid {
    x: Leaf;
    y: Leaf;
}

struct Root {
    m1: Mid;
    m2: Mid;
}

contract BroadTree {
    tree: Root;

    init() {
        self.tree = Root{
            m1: Mid{x: Leaf{v:1}, y: Leaf{v:2}},
            m2: Mid{x: Leaf{v:3}, y: Leaf{v:4}}
        };
    }
}