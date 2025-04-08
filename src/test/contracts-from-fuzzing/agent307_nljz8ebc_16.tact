struct Bottom {
    a: Int;
}

struct Middle1 {
    bottom: Bottom;
}

struct Middle2 {
    bottom: Bottom;
}

struct Top {
    m1: Middle1;
    m2: Middle2;
}

contract DiamondStruct {
    val: Top;

    init() {
        self.val = Top{
            m1: Middle1{ bottom: Bottom{ a: 1 } },
            m2: Middle2{ bottom: Bottom{ a: 2 } },
        };
    }
}