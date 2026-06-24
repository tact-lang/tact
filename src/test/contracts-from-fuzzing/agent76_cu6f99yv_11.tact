struct Tiny {
    x: Int as uint4;
}

contract SmallInts {
    t1: Tiny;
    t2: Tiny;
    t3: Tiny;
    init() {
        self.t1 = Tiny{ x: 3 };
        self.t2 = Tiny{ x: 5 };
        self.t3 = Tiny{ x: 9 };
    }
}