struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { c: Int; }

struct Top {
    s1: S1?;
    s2: S2?;
    s3: S3?;
}

contract MultiOptionalStructs {
    data: Top;
    init() {
        self.data = Top{
            s1: null,
            s2: S2{ b: 8 },
            s3: null
        };
    }
}