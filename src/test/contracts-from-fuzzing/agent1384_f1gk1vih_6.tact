struct Sub {
    s1: Int;
    s2: Bool;
}

struct Mid {
    m1: Int;
    m2: Sub;
}

struct Top {
    t1: Mid;
    t2: Mid;
}

contract TreeShape {
    root: Top;

    init() {
        self.root = Top{
            t1: Mid{m1: 1, m2: Sub{s1: 11, s2: true}},
            t2: Mid{m1: 2, m2: Sub{s1: 22, s2: false}}
        };
    }
}