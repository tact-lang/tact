struct RecA {
    x: Int;
}

struct RecB {
    a: RecA;
}

contract DoubleWrap {
    b: RecB;
    init() {
        self.b = RecB{a: RecA{x:99}};
    }
}