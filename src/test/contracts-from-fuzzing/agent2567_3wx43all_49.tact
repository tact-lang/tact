struct Bottom {
    x: Int;
}

struct Mid {
    b1: Bottom;
    b2: Bottom;
}

contract ComplexHierarchy {
    m: Mid;

    init() {
        self.m = Mid{
            b1: Bottom{x:1},
            b2: Bottom{x:2}
        };
    }
}