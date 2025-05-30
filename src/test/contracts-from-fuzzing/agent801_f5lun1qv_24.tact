struct Leaf {
    x: Int;
    y: Int?;
}

struct Mid {
    l1: Leaf;
    l2: Leaf;
}

struct Root {
    m: Mid;
}

contract TreeContract {
    root: Root;

    init() {
        self.root = Root{
            m: Mid{
                l1: Leaf{ x: 1, y: null },
                l2: Leaf{ x: 2, y: 3 }
            }
        };
    }
}