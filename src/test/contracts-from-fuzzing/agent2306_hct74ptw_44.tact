struct Obvious {
    a: Int;
}

struct Wrap {
    b: Obvious?;
    c: Int;
}

contract OptMidLevel {
    d: Wrap?;

    init() {
        self.d = null;
    }
}
