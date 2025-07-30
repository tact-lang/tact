struct S1 { a: Int; }
struct S2 { a: Int; }
struct S3 { a: Int; }
struct S4 { a: Int; }
struct S5 { a: Int; }

contract ManyStructFields {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;

    init() {
        self.s1 = S1 { a: 1 };
        self.s2 = S2 { a: 2 };
        self.s3 = S3 { a: 3 };
        self.s4 = S4 { a: 4 };
        self.s5 = S5 { a: 5 };
    }
}