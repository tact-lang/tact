// large struct chain with deep optionals in params
struct S5 { val: Int?; }
struct S4 { s5: S5; }
struct S3 { s4: S4; }
struct S2 { s3: S3; }
struct S1 { s2: S2; }

contract DeepParam(
    data: S1?,
    flag: Bool?,
) {}
