struct InnerMost {
    f: Int;
}

struct Mid1 {
    i: InnerMost;
}

struct Mid2 {
    i: InnerMost;
}

struct Top {
    a: Mid1;
    b: Mid2;
}

contract ParallelNested {
    val: Top;

    init() {
        self.val = Top{
            a: Mid1{ i: InnerMost{ f: 1 } },
            b: Mid2{ i: InnerMost{ f: 2 } }
        };
    }
}
