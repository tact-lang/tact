struct Base {
    val: Int;
}

struct Mid1 {
    b: Base;
}

struct Mid2 {
    b: Base;
}

struct Top {
    m1: Mid1;
    m2: Mid2;
}

contract TestContract {
    t: Top;

    init() {
        self.t = Top{
            m1: Mid1{ b: Base{ val:1 } },
            m2: Mid2{ b: Base{ val:2 } }
        };
    }
}