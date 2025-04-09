struct Leaf {
    x: Int;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    b1: Branch;
    b2: Branch;
}

contract OptNestChain {
    data: Root;

    init() {
        self.data = Root{
            b1: Branch{ leaf: Leaf{ x: 1 } },
            b2: Branch{ leaf: null }
        };
    }
}