struct S1 {
    f1: Int;
}

struct S2 {
    f2: Int;
}

contract MultiStructs {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{f1: 1};
        self.s2 = S2{f2: 2};
    }
}