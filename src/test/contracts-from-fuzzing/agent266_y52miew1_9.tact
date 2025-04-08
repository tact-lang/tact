struct Mid {
    p1: Int;
    p2: Bool;
}

struct Top {
    m1: Mid;
    m2: Mid;
    flag: Bool;
}

contract DuplicateNested {
    val: Top;

    init() {
        self.val = Top{
            m1: Mid{ p1: 1, p2: true },
            m2: Mid{ p1: 2, p2: false },
            flag: true
        };
    }
}