struct RecA {
    a: Int;
    b: RecB;
}

struct RecB {
    x: Int;
}

contract RecursionLike {
    data: RecA;

    init() {
        self.data = RecA{
            a: 7,
            b: RecB{ x: 8 }
        };
    }
}
