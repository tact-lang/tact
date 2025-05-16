struct S1 {
    a: Int?;
}

struct S2 {
    s1: S1?;
}

contract OptionalStructChain {
    s2: S2;

    init() {
        self.s2 = S2{s1: null};
    }
}