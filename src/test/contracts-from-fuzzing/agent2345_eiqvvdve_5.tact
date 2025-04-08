struct S1 {
    f1: Int;
}

struct S2 {
    s1opt: S1?;
}

contract OptStructField {
    sf: S2;

    init() {
        self.sf = S2{ s1opt: null };
    }
}