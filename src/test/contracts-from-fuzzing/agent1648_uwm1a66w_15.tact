struct IntPair {
    a: Int;
    b: Int;
}

struct Another {
    p1: IntPair;
    p2: IntPair;
}

contract Doubles {
    data: Another;

    init() {
        self.data = Another{
            p1: IntPair{ a: 1, b: 2 },
            p2: IntPair{ a: 3, b: 4 }
        };
    }
}