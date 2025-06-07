// multiple nested structures with mix of optionals and defaults
struct S1 {
    s2: S2;
    optstr: String?;
}

struct S2 {
    s3: S3;
}

struct S3 {
    intval: Int = 55;
}

contract MultiNestPersist {
    val: S1;

    init() {
        self.val = S1{
            s2: S2{ s3: S3{} },
            optstr: null
        };
    }
}