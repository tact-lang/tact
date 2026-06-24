struct RecA {
    b: RecB;
}

struct RecB {
    c: Int;
}

contract RecNest {
    d: RecA;
    init() {
        self.d = RecA {
            b: RecB { c: 10 }
        };
    }
}