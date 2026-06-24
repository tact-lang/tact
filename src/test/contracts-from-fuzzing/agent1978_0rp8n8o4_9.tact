struct S1 {
    f1: Int?;
}

struct S2 {
    f2: Int?;
}

struct S3 {
    f3: Int?;
}

contract OptionalsFan {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{f1:1};
        self.s2 = S2{f2:2};
        self.s3 = S3{f3:3};
    }
}