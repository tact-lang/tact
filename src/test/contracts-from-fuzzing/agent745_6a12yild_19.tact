struct Tail {
    x: Int;
}

struct Mid1 {
    a: Tail;
}

struct Mid2 {
    b: Tail;
}

struct Top {
    f1: Mid1;
    f2: Mid2;
}

contract ParalleledNested {
    value: Top;

    init() {
        self.value = Top{
            f1: Mid1{ a: Tail{ x: 1 } },
            f2: Mid2{ b: Tail{ x: 2 } }
        };
    }
}