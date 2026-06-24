// Large nested struct chain with defaults
struct Bottom {
    x: Int = 123;
}

struct Middle {
    b1: Bottom;
    b2: Bottom;
}

struct Top {
    m1: Middle;
    m2: Middle;
    flag: Bool;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            m1: Middle{b1: Bottom{}, b2: Bottom{}},
            m2: Middle{b1: Bottom{}, b2: Bottom{}},
            flag: true
        };
    }
}
