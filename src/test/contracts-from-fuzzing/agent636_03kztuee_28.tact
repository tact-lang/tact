struct S1 { f1: Int; }
struct S2 { f2: Int; }
struct S3 { f3: Int; }
struct S4 { s1: S1; s2: S2; s3: S3; }

contract MultiStructs {
    s: S4;

    init() {
        self.s = S4{
            s1: S1{ f1: 1 },
            s2: S2{ f2: 2 },
            s3: S3{ f3: 3 }
        };
    }
}
