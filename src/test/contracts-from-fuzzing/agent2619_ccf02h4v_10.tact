struct RecA {
    b: RecB;
}

struct RecB {
    c: Int;
}

contract RecursiveContainer {
    r: RecA;

    init() {
        self.r = RecA{
            b: RecB{ c: 123 }
        };
    }
}