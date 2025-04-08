// deeply recursive nesting multiple optionals and defaults
struct S3 {
    f1: Int = 1;
    f2: Bool?;
}

struct S2 {
    s3: S3?;
    x: Int;
}

struct S1 {
    s2: S2?;
    s3: S3;
}

contract MultiDeep {
    s1: S1;

    init() {
        self.s1 = S1{
            s2: S2{
                s3: null,
                x: 42
            },
            s3: S3{
                f1: 7,
                f2: null
            }
        };
    }
}