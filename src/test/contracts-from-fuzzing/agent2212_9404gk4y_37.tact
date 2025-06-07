struct S1 { v: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; }
struct S4 { s3: S3; }

contract Test(
    num: Int,
    optBool: Bool?,
    nested1: S4,
    nested2: S4?
) {}
