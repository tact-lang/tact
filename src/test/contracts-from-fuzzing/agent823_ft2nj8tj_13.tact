struct SeqA {
    a1: Int;
    a2: Int;
}

struct SeqB {
    b1: Bool;
    b2: Bool;
}

struct SeqC {
    c1: String;
    c2: String;
}

contract Sequential {
    sA: SeqA;
    sB: SeqB;
    sC: SeqC;

    init() {
        self.sA = SeqA{ a1: 1, a2: 2 };
        self.sB = SeqB{ b1: true, b2: false };
        self.sC = SeqC{ c1: "x", c2: "y" };
    }
}