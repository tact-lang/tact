// Deep option struct chain
struct S4 { v: Int?; }
struct S3 { s: S4?; }
struct S2 { s: S3?; }
struct S1 { s: S2?; }

contract UltraDeepOption {
    f: S1;

    init() {
        self.f = S1{
            s: null,
        };
    }
}