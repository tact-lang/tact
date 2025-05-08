// nested struct chain, everything nullable
struct S3 { x: Int?; }
struct S2 { s3: S3?; }
struct S1 { s2: S2?; }

contract LongNullableChain {
    val: S1?;
    init() {
        self.val = null;
    }
}