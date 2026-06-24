struct SOpt {
    a: Int?;
}

struct SReg {
    b: Int;
}

contract MixedOptReg {
    s1: SOpt;
    s2: SReg;
    init() {
        self.s1 = SOpt{ a: null };
        self.s2 = SReg{ b: 33 };
    }
}