struct S1 { a: Int = 1; }
struct S2 { s1: S1; b: Int = 2; }
struct S3 { s2: S2; c: Int = 3; }
struct S4 { s3: S3; d: Int = 4; }

contract DeeplyNested {
    s4: S4 = S4{ s3: S3{ s2: S2{ s1: S1{} } } };
    init() {}
}