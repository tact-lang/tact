struct S {
    f: Int;
}

contract ManySameStructs {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{ f:1 };
        self.s2 = S{ f:2 };
        self.s3 = S{ f:3 };
    }
}