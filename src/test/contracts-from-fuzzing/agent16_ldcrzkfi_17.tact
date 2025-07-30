struct Deep {
    innermost: Int;
}

struct Middle1 {
    d: Deep;
}

struct Middle2 {
    d: Deep;
}

struct Top {
    m1: Middle1;
    m2: Middle2;
}

contract TwoPaths {
    nested: Top;

    init() {
        self.nested = Top{
            m1: Middle1{ d: Deep{ innermost: 1 } },
            m2: Middle2{ d: Deep{ innermost: 2 } }
        };
    }
}