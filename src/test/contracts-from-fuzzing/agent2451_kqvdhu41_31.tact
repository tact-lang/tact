struct Basic {
    a: Int;
}

contract RepeatAssign {
    b: Basic;

    init() {
        self.b = Basic{ a: 1 };
        self.b = Basic{ a: 2 };
    }
}