struct S1 { a: Int = 1; }
struct S2 { b: Int = 2; }
struct S3 { c: Int = 3; }

contract MultiDefaults {
    v1: S1 = S1{};
    v2: S2 = S2{};
    v3: S3 = S3{};
}