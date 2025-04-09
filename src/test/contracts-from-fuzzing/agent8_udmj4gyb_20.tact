struct InnerA {
    a: Int;
    rem: Slice as remaining;
}

struct InnerB {
    b: Int;
    rem: Slice as remaining;
}

struct Both {
    x: InnerA;
    y: InnerB;
}

contract TestContract {
    all: Both;

    init() {
        self.all = Both{
            x: InnerA{a:1, rem:emptyCell().asSlice()},
            y: InnerB{b:2, rem:emptyCell().asSlice()},
        };
    }
}
