// deeply nested with defaults and optionals
struct S1 { a: Int = 1; }
struct S2 { s1: S1? = null; }
struct S3 { s2: S2? = null; }
struct S4 { s3: S3? = null; }

contract DeepDefaults {
    data: S4;

    init() {
        self.data = S4{};
    }
}