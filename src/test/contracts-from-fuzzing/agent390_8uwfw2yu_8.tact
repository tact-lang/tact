struct Leaf {
    a: Int;
    b: Int?;
    c: Bool?;
}

struct Middle {
    l1: Leaf;
    l2: Leaf;
}

struct Root {
    m1: Middle;
    m2: Middle;
}

contract MultiNested {
    root: Root;

    init() {
        self.root = Root{
            m1: Middle{
                l1: Leaf{ a: 1, b: null, c: null },
                l2: Leaf{ a: 2, b: 3, c: true }
            },
            m2: Middle{
                l1: Leaf{ a: 4, b: null, c: false },
                l2: Leaf{ a: 5, b: 6, c: null }
            }
        };
    }
}
