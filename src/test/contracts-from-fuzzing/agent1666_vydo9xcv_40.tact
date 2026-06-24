struct S1 { f: Int? }
struct S2 { s1: S1? }
struct S3 { s2: S2? }
contract NullableChain {
    storage: S3;
    init() {
        self.storage = S3{ s2: null };
    }
}