struct Leaf1 {
    x: Int;
}
struct Leaf2 {
    y: Bool;
}

struct Mid {
    l1: Leaf1;
    l2: Leaf2;
}

struct Root {
    m: Mid;
}

contract TreeStyle {
    root: Root;

    init() {
        self.root = Root{
            m: Mid{
                l1: Leaf1{ x: 5 },
                l2: Leaf2{ y: true },
            },
        };
    }
}