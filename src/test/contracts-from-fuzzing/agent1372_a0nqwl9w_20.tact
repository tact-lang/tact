struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { z: String; }

contract Combo(
    a: Int,
    b: Bool,
    c: String,
    d: Cell,
    e: Int?, f: Bool?, g: String?, h: Cell?,
    s1: S1,
    s2: S2,
    s3: S3,
) {}