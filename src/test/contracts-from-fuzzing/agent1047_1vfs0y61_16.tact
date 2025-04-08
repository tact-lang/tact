struct Mid {
    x: Int;
}

contract Test {
    m1: Mid;
    m2: Mid;
    m3: Mid;
    m4: Mid;
    m5: Mid;

    init() {
        self.m1 = Mid{ x: 1 };
        self.m2 = Mid{ x: 2 };
        self.m3 = Mid{ x: 3 };
        self.m4 = Mid{ x: 4 };
        self.m5 = Mid{ x: 5 };
    }
}