struct Middle {
    m1: Int;
    m2: Bool?;
}

struct OuterMost {
    o1: Middle;
    o2: Middle?;
}

contract OptionalMiddleFields {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            o1: Middle{m1: 1, m2: null},
            o2: null
        };
    }
}