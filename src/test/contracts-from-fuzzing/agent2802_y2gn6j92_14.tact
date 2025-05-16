struct S {
    a: Int;
}

contract WithArrayOfStructs {
    s1: S = S{ a: 1 };
    s2: S = S{ a: 2 };
    s3: S = S{ a: 3 };

    init() {
        self.s1 = S{ a: 4 };
        self.s2 = S{ a: 5 };
        self.s3 = S{ a: 6 };
    }
}