struct S1 { f1: Int }
struct S2 { f2: Bool }
struct S3 { f3: String }

struct Combined {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract TestMultiStruct {
    combo: Combined;

    init() {
        self.combo = Combined{
            s1: S1{ f1: 10 },
            s2: S2{ f2: true },
            s3: S3{ f3: "hi" }
        };
    }
}
