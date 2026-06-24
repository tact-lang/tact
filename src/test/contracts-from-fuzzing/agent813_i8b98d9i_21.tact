struct S {
    x: Int;
    y: Int;
}

contract ArrayLikeFields {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{ x:1, y:2 };
        self.s2 = S{ x:3, y:4 };
        self.s3 = S{ x:5, y:6 };
    }
}