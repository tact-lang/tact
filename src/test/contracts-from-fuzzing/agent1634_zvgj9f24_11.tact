struct S1 { val: Int; }
struct S2 { val: Int; }
struct S3 { val: Int; }

contract ManyStructFields {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{ val: 1 };
        self.s2 = S2{ val: 2 };
        self.s3 = S3{ val: 3 };
    }
}