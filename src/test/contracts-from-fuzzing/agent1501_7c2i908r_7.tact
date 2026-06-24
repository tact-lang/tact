struct Tiny {
    a: Int;
}

contract TestContract {
    s1: Tiny;
    s2: Tiny;
    s3: Tiny;
    s4: Tiny;
    s5: Tiny;

    init() {
        self.s1 = Tiny{ a: 1 };
        self.s2 = Tiny{ a: 2 };
        self.s3 = Tiny{ a: 3 };
        self.s4 = Tiny{ a: 4 };
        self.s5 = Tiny{ a: 5 };
    }
}