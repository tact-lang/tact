struct InnerA {
    x: Int;
}

struct InnerB {
    y: Bool;
}

struct Both {
    a: InnerA;
    b: InnerB;
}

contract TestContract {
    field: Both;

    init() {
        self.field = Both{
            a: InnerA{ x: 101 },
            b: InnerB{ y: false }
        };
    }
}