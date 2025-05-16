struct S1 { s: String }
struct S2 { s: String }
struct S3 { s1: S1; s2: S2 }

contract DeepStrings {
    s3: S3;
    init() {
        self.s3 = S3{
            s1: S1{ s: "one" },
            s2: S2{ s: "two" },
        };
    }
}