struct S1 {
    f1: Int;
    f2: Bool;
}

struct S2 {
    s11: S1;
    s12: S1;
    s13: S1;
    s14: S1;
    s15: S1;
    s16: S1;
    s17: S1;
    s18: S1;
}

contract WideNested {
    big: S2;

    init() {
        self.big = S2{
            s11: S1{ f1: 1, f2: true },
            s12: S1{ f1: 2, f2: false },
            s13: S1{ f1: 3, f2: true },
            s14: S1{ f1: 4, f2: false },
            s15: S1{ f1: 5, f2: true },
            s16: S1{ f1: 6, f2: false },
            s17: S1{ f1: 7, f2: true },
            s18: S1{ f1: 8, f2: false },
        };
    }
}