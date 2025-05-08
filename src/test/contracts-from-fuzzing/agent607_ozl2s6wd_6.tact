struct Leaf {
    value: Int = 777;
}

struct Branch {
    leaf: Leaf;
    optVal: Int?;
}

struct Root {
    b1: Branch;
    b2: Branch = Branch{ leaf: Leaf{}, optVal: null };
}

contract DefaultNest {
    root: Root;
    init() {
        self.root = Root{
            b1: Branch{ leaf: Leaf{}, optVal: 42 }
        };
    }
}