struct Leaf {
    v: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf;
}

struct Root {
    b1: Branch;
    b2: Branch?;
}

contract TreeOptional {
    r: Root;
    init() {
        self.r = Root{
            b1: Branch{ left: null, right: Leaf{ v: 1 } },
            b2: null
        };
    }
    receive() {
        let _ = self.r.b1.right.v;
    }
}