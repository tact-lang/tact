struct Leaf {
    n: Int;
}

struct MidLayer {
    l1: Leaf;
    l2: Leaf;
}

contract DuplicatedStructs {
    m1: MidLayer;
    m2: MidLayer;

    init() {
        self.m1 = MidLayer{ l1: Leaf{n:1}, l2: Leaf{n:2} };
        self.m2 = MidLayer{ l1: Leaf{n:3}, l2: Leaf{n:4} };
    }
}