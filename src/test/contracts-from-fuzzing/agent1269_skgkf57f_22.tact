struct S1 {
    f1: Int;
    f2: Int?;
}

struct S2 {
    g1: S1;
    g2: S1?;
}

contract MultiOpt {
    val: S2;
    init() {
        self.val = S2{
            g1: S1{ f1: 1, f2: null },
            g2: null,
        };
    }
}