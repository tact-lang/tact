struct SAB {
    a: Int;
    b: Bool;
    c: String;
}

contract ArrayLike {
    s1: SAB;
    s2: SAB;
    s3: SAB;

    init() {
        self.s1 = SAB{ a: 1, b: true, c: "x" };
        self.s2 = SAB{ a: 2, b: false, c: "y" };
        self.s3 = SAB{ a: 3, b: true, c: "z" };
    }
}
