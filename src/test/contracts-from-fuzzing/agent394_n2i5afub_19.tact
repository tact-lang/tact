struct S {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: Bool?;
}

contract TestContract {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{ a: 11, b: true, c: null, d: null };
        self.s2 = S{ a: 22, b: false, c: 33, d: true };
        self.s3 = S{ a: 44, b: true, c: 55, d: false };
    }
}