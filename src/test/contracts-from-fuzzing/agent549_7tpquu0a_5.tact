struct S1 {
    a: Int?;
    s2: S2;
}

struct S2 {
    b: Bool?;
    s3: S3;
}

struct S3 {
    c: String?;
    val: Int;
}

contract OptNestTest {
    s: S1;
    init() {
        self.s = S1{
            a: null,
            s2: S2{
                b: null,
                s3: S3{
                    c: null,
                    val: 42,
                },
            },
        };
    }
}