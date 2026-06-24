struct Leaf {
    data: Int;
}

struct Mid {
    l1: Leaf;
    l2: Leaf;
}

struct Root {
    m: Mid;
}

contract DeepTree {
    root: Root = Root { m: Mid { l1: Leaf{data:1}, l2: Leaf{data:2} } };
    sum: Int = 0;

    init() {
        self.sum = self.root.m.l1.data + self.root.m.l2.data;
    }
}
