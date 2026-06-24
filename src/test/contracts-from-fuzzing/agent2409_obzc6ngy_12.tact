struct InnerA {
    fA: Int;
}

struct InnerB {
    fB: Bool;
}

struct Both {
    x: InnerA;
    y: InnerB;
}

contract MultipleStructFields {
    data: Both;

    init() {
        self.data = Both{
            x: InnerA{ fA: 7 },
            y: InnerB{ fB: false }
        };
    }
}