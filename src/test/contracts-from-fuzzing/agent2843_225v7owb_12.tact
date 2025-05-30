struct S1 {
    s2: S2;
}

struct S2 {
    s3a: S3;
    s3b: S3;
}

struct S3 {
    flag: Bool;
    val: Int?;
}

contract Test12 {
    nested: S1;

    init() {
        self.nested = S1{
            s2: S2{
                s3a: S3{ flag: true, val: null },
                s3b: S3{ flag: false, val: 123 }
            }
        };
    }
}