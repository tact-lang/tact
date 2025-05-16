struct S1 {
    f: Int;
}

struct S2 {
    f: Int;
}

struct S3 {
    f: Int;
}

contract ManyStructs {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{f:1};
        self.s2 = S2{f:2};
        self.s3 = S3{f:3};
    }
}