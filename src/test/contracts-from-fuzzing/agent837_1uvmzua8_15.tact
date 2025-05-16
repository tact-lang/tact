struct S {
    a: Int;
    b: Bool?;
    c: Int;
    d: Bool;
}

contract ManyStructs {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    init() {
        self.s1 = S{ a: 1, b: false, c: 2, d: true };
        self.s2 = S{ a: 3, b: null,  c: 4, d: false };
        self.s3 = S{ a: 5, b: true,  c: 6, d: true };
        self.s4 = S{ a: 7, b: false, c: 8, d: true };
    }
}