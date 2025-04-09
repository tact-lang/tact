struct S1 { f: Int }
struct S2 { f: S1? }
struct S3 { f: S2? }

contract OptChain {
    x: S3?;

    init() {
        self.x = S3{ f: S2{ f: S1{ f: 55 } } };
    }
}