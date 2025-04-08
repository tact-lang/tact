struct S11 { f1: Int; }
struct S12 { f2: Int; }
struct S13 { f3: Int; }
struct S14 { f4: Int; }

contract MultiEmbeddedStructs {
    s11: S11;
    s12: S12;
    s13: S13;
    s14: S14;

    init() {
        self.s11 = S11{ f1: 1 };
        self.s12 = S12{ f2: 2 };
        self.s13 = S13{ f3: 3 };
        self.s14 = S14{ f4: 4 };
    }
}