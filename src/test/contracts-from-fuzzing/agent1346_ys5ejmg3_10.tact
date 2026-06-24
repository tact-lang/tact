struct Leaf {
    id: Int;
}

struct Mid {
    a: Leaf;
    b: Leaf;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract WideTree {
    root: Top = Top {
        m1: Mid { a: Leaf{id:1}, b: Leaf{id:2} },
        m2: Mid { a: Leaf{id:3}, b: Leaf{id:4} }
    };
    sum: Int = 0;

    init() {
        self.sum = self.root.m1.a.id + self.root.m2.b.id;
    }
}
