struct Mid {
    m1: Int;
    m2: Int;
}

struct Outer {
    o1: Int;
    mid: Mid;
    o2: Int;
}

contract NestedMid {
    val: Outer;
    init() {
        self.val = Outer{
            o1: 10,
            mid: Mid{m1: 20, m2: 30},
            o2: 40
        };
    }
}