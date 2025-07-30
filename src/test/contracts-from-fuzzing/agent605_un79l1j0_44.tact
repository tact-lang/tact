struct First {
    a: Int;
}

struct Second {
    f1: First;
    b: Int;
}

struct Third {
    f2: Second;
    c: Int;
}

contract MultiNested {
    val: Third;

    init() {
        self.val = Third {
            f2: Second {
                f1: First { a: 1 },
                b: 2
            },
            c: 3
        };
    }
}