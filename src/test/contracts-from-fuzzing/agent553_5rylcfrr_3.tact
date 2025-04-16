struct S1 { f1: Int; }
struct S2 { f2: Int; }
struct S3 { f3: Int; }

contract ManyStructs {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{f1: 10};
        self.s2 = S2{f2: 20};
        self.s3 = S3{f3: 30};
    }
}