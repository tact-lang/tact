struct Leaf {
    f1: Int;
    f2: Bool;
}

struct Mid {
    l1: Leaf;
    l2: Leaf;
}

struct Root {
    m: Mid;
}

contract DeepThreeLayers {
    data: Root;

    init() {
        self.data = Root{
            m: Mid{
                l1: Leaf{ f1: 1, f2: true },
                l2: Leaf{ f1: 2, f2: false }
            }
        };
    }
}