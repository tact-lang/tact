struct Bottom {
    v: Int;
}

struct Mid {
    b1: Bottom;
    b2: Bottom;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract DupNested {
    data: Top;

    init() {
        self.data = Top{
            m1: Mid{ b1: Bottom{v:1}, b2: Bottom{v:2} },
            m2: Mid{ b1: Bottom{v:3}, b2: Bottom{v:4} }
        };
    }
}