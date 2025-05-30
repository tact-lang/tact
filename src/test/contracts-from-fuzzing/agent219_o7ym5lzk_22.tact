struct RecA {
    v1: Int;
}

struct RecB {
    v2: Int;
}

struct Wrap {
    a: RecA;
    b: RecB;
}

contract TwoNestWraps {
    data: Wrap;

    init() {
        self.data = Wrap{
            a: RecA{ v1: 42 },
            b: RecB{ v2: 77 }
        };
    }
}