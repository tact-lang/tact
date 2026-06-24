struct RecA {
    b: RecB;
}

struct RecB {
    a: Int;
}

contract IndirectRecursive {
    store: RecA;
    init() {
        self.store = RecA{ b: RecB{ a: 42 } };
    }
}