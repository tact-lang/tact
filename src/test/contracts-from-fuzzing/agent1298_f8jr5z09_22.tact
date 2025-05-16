struct S1 { a: Int }
struct S2 { s: S1 }
struct S3 { s: S2 }

contract OptMiddle {
    s3: S3?;
    init() {
        self.s3 = null;
    }
}