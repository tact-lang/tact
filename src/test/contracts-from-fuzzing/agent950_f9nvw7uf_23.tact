// deeply nested struct with large number of optionals
struct S3 { a: Int?; b: Bool?; c: String?; }
struct S2 { s3: S3?; x: Int?; y: Bool?; }
struct S1 { s2: S2?; t: Int?; } 

contract LargeDeepOpt {
    s: S1?;

    init() {
        self.s = null;
    }
}