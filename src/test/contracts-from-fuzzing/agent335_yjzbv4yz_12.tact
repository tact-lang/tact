struct Bottom {
    f1: Int;
}

struct Middle1 {
    f: Bottom;
}

struct Middle2 {
    f: Bottom;
}

struct Top {
    m1: Middle1;
    m2: Middle2;
}

contract MultiBranchNested {
    root: Top;

    init() {
        self.root = Top{
            m1: Middle1{ f: Bottom{ f1: 1 } },
            m2: Middle2{ f: Bottom{ f1: 2 } },
        };
    }
}
