struct S1 {
    val1: Int;
}

struct S2 {
    val2: Int;
}

struct S3 {
    val3: Int;
}

contract MultipleNestedStructs {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{val1: 1};
        self.s2 = S2{val2: 2};
        self.s3 = S3{val3: 3};
    }
}
