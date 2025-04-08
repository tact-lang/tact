struct SeqA {
    valA: Int;
}

struct SeqB {
    valB: Int;
}

struct SeqC {
    valC: Int;
}

contract OrderedContract {
    a: SeqA;
    b: SeqB;
    c: SeqC;

    init() {
        self.a = SeqA{ valA: 1 };
        self.b = SeqB{ valB: 2 };
        self.c = SeqC{ valC: 3 };
    }
}