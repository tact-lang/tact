struct Mid {
    x: Int;
    y: Int;
}

contract MultipleVars {
    m1: Mid;
    m2: Mid;
    m3: Mid;

    init() {
        self.m1 = Mid{ x:1, y:2 };
        self.m2 = Mid{ x:3, y:4 };
        self.m3 = Mid{ x:5, y:6 };
    }
}