struct Sub {
    val: Int;
}

struct Mid {
    s1: Sub;
    s2: Sub;
}

struct Top {
    m1: Mid;
    m2: Mid;
    flag: Bool;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            m1: Mid{ s1: Sub{val:3}, s2: Sub{val:4} },
            m2: Mid{ s1: Sub{val:5}, s2: Sub{val:6} },
            flag: true,
        };
    }
}