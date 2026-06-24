struct InnerA {
    a1: Int;
    a2: Int;
}
struct InnerB {
    b1: Int;
    b2: Int;
}

struct Mid {
    m1: InnerA;
    m2: InnerB;
}

contract Test {
    mid: Mid;

    init() {
        self.mid = Mid{
            m1: InnerA{a1:1, a2:2},
            m2: InnerB{b1:3, b2:4}
        };
    }
}
