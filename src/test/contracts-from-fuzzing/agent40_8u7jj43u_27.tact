struct S1 {
    f1: Int;
}

struct S2 {
    f2: Int;
    s1: S1;
}

struct S3 {
    s2: S2;
    f3: Int;
}

contract TestStructSeq {
    s3: S3;

    init() {
        self.s3 = S3{
            s2: S2{f2:2,s1:S1{f1:1}},
            f3: 3
        };
    }

    receive() {
        let tmp = self.s3;
    }
}