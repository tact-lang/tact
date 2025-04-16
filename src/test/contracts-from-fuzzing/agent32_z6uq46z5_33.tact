struct S {
    id: Int;
}

contract ArrayLike {
    s1: S;
    s2: S;
    s3: S;
    s4: S;

    init() {
        self.s1 = S{ id:1 };
        self.s2 = S{ id:2 };
        self.s3 = S{ id:3 };
        self.s4 = S{ id:4 };
    }
}
