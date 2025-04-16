struct Leaf {
    v: Int;
}

struct Middle {
    left: Leaf;
    right: Leaf;
}

struct Top {
    m1: Middle;
    m2: Middle;
}

contract ComplexNested {
    storage: Top;

    init() {
        self.storage = Top{
            m1: Middle{
                left: Leaf{ v: 1 },
                right: Leaf{ v: 2 }
            },
            m2: Middle{
                left: Leaf{ v: 3 },
                right: Leaf{ v: 4 }
            }
        };
    }
}