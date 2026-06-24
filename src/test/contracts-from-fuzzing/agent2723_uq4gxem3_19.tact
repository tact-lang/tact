struct RecA {
    b: Int?;
}

struct RecB {
    a: RecA?;
}

contract CrossOptional {
    s: RecB;
    init() {
        self.s = RecB{ a: RecA{ b: null } };
    }
}