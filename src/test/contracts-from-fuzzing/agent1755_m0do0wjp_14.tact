struct S3 {
    deep: Int?;
}

struct S2 {
    s3: S3?;
}

struct S1 {
    s2: S2?;
}

contract TestContract {
    nested: S1 = S1{
        s2: null
    };
}
