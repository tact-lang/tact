struct S {
    x: Int;
    y: Int?;
}

contract MultiVars {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{ x: 1, y: null };
        self.s2 = S{ x: 2, y: null };
        self.s3 = S{ x: 3, y: null };
    }
}