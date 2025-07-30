// deeply nested struct with defaults everywhere
struct S1 { a: Int = 1 }
struct S2 { s1: S1 = S1{} }
struct S3 { s2: S2 = S2{} }
struct S4 { s3: S3 = S3{} }
struct S5 { s4: S4 = S4{} }

contract DeepDefaults {
    data: S5;

    init() {
        self.data = S5{};
    }
}