// optional strings at many levels
struct S1 { s: String?; }
struct S2 { s1: S1?; }
struct S3 { s2: S2?; }

contract MultiOptString {
    storage: S3;

    init() {
        self.storage = S3{ s2: null };
    }
}