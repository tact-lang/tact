struct S1 { b: Bool }
struct S2 { s: S1 }
struct S3 { s: S2 }
struct S4 { s: S3 }

contract DeepStructs4Levels {
    s: S4;
    init() {
        self.s = S4 { s: S3 { s: S2 { s: S1 { b:true } } } };
    }
}