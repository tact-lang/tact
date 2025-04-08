struct S1 { n: Int = 1; }
struct S2 { m: Int = 2; }
struct S3 { k: Int = 3; }

struct Layer1 {
    s1: S1 = S1{};
    s2: S2 = S2{};
}

struct Layer2 {
    layer1: Layer1 = Layer1{};
    s3: S3 = S3{};
}

contract MultiLayer {
    data: Layer2 = Layer2{};
}