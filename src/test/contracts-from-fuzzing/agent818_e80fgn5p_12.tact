struct MultiNested {
    a: One;
    b: Two;
    c: Three;
}

struct One {
    f: Int;
}

struct Two {
    f: String?;
}

struct Three {
    f: Bool;
}

contract MultiNestContract {
    s: MultiNested;

    init() {
        self.s = MultiNested{
            a: One{ f: 5 },
            b: Two{ f: null },
            c: Three{ f: true }
        };
    }
}