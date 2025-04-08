struct S1 { a: Int; }
struct S2 { a: Int; }
struct S3 { a: Int; }
struct S4 { a: Int; }

contract ManyStructParams(
    p1: S1, p2: S2, p3: S3, p4: S4,
    flag: Bool
) {}