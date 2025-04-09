struct Leaf {
    value: Int;
}

struct Middle {
    left: Leaf;
    right: Leaf;
}

struct Root {
    m: Middle;
}

contract TestContract {
    bigTree: Root;
    init() {
        self.bigTree = Root{
            m: Middle{
                left: Leaf{ value: 1 },
                right: Leaf{ value: 2 }
            }
        };
    }
}