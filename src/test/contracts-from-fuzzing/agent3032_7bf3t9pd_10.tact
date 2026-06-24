struct Mid {
    x: Int;
    y: Int;
}

contract MultiVars {
    a: Mid;
    b: Mid;
    c: Mid;
    d: Mid;
    e: Mid;

    init() {
        self.a = Mid{ x:1, y:1 };
        self.b = Mid{ x:2, y:2 };
        self.c = Mid{ x:3, y:3 };
        self.d = Mid{ x:4, y:4 };
        self.e = Mid{ x:5, y:5 };
    }
}