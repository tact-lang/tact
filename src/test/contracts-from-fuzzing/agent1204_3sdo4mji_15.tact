struct S1 {
    a: Int?;
}

struct S2 {
    b: Int?;
    s1: S1?;
}

struct S3 {
    c: Int?;
    s2: S2?;
}

contract DeepOptional {
    deep: S3;

    init() {
        self.deep = S3{
            c: null,
            s2: null
        };
    }
}
