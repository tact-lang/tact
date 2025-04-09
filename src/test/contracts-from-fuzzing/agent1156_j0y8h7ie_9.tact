struct S1 { v1: Int = 1; }
struct S2 { v2: Int = 2; s1: S1; }
struct S3 { v3: Int = 3; s2: S2; }
struct S4 { v4: Int = 4; s3: S3; }

contract NestedWithPrimitives {
    val: Int = 99;
    nested: S4 = S4{ s3: S3{ s2: S2{ s1: S1{} } } };
    init() {}
}