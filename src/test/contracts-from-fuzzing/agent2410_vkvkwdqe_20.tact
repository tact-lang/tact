struct Deep {
    n1: Int;
    n2: Int;
}

struct Mid {
    d1: Deep;
    d2: Deep;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract MultipleNestings {
    val: Top;

    init() {
        self.val = Top{
            m1: Mid{
                d1: Deep{n1:1,n2:2},
                d2: Deep{n1:3,n2:4},
            },
            m2: Mid{
                d1: Deep{n1:5,n2:6},
                d2: Deep{n1:7,n2:8},
            },
        };
    }
}