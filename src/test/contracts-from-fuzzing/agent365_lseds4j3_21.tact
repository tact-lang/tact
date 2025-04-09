struct Tiny {
    x: Int;
}

contract ManyTiny {
    t1: Tiny;
    t2: Tiny;
    t3: Tiny;
    t4: Tiny;
    t5: Tiny;

    init() {
        self.t1 = Tiny{ x: 1 };
        self.t2 = Tiny{ x: 2 };
        self.t3 = Tiny{ x: 3 };
        self.t4 = Tiny{ x: 4 };
        self.t5 = Tiny{ x: 5 };
    }
}