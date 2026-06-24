struct S1 {
    a: Int = 1;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract MultiLayerStruct {
    s3: S3;

    init() {
        self.s3 = S3{ s2: S2{ s1: S1{} } };
    }
}
