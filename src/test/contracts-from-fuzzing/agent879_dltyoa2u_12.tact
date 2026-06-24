struct Leaf { leafVal: Int; }

struct Mid {
    a: Leaf;
    b: Leaf;
    c: Leaf;
}

struct Top {
    m: Mid;
}

contract MultiBranchNest {
    t: Top;
    init() {
        self.t = Top{
            m: Mid{
                a: Leaf{ leafVal: 1 },
                b: Leaf{ leafVal: 2 },
                c: Leaf{ leafVal: 3 }
            }
        };
    }
}
