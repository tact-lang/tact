struct S1 {
    v1: Int;
}

struct S2 {
    v2: Int;
}

struct S3 {
    v3: Int;
}

contract ManyStructs {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{v1: 1};
        self.s2 = S2{v2: 2};
        self.s3 = S3{v3: 3};
    }
}