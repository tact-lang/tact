struct S {
    a: Int?;
    b: Bool?;
}

contract MultiS {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{a: null, b: null};
        self.s2 = S{a: null, b: null};
    }
}