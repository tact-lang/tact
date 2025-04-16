struct Leaf {
    flag: Bool;
}

struct Mid {
    leaf: Leaf;
}

struct Root {
    mid: Mid;
}

contract Test {
    data: Root;
    init() {
        self.data = Root{
            mid: Mid{
                leaf: Leaf{ flag: true }
            }
        };
    }
}