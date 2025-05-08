struct Leaf {
    x: Int;
}

struct Mid1 {
    leaf: Leaf;
}
struct Mid2 {
    leaf: Leaf;
}

struct Root {
    m1: Mid1;
    m2: Mid2;
}

contract TwoBranches {
    val: Root;

    init() {
        self.val = Root{
            m1: Mid1{leaf: Leaf{x:1}},
            m2: Mid2{leaf: Leaf{x:2}},
        };
    }
}