struct Child {
    field: Int;
}

struct Parent1 {
    ch1: Child;
}

struct Parent2 {
    ch2: Child;
}

struct Top {
    p1: Parent1;
    p2: Parent2;
}

contract DiamondShape {
    t: Top;

    init() {
        self.t = Top {
            p1: Parent1{ ch1: Child{field:1} },
            p2: Parent2{ ch2: Child{field:2} }
        };
    }
}