struct S1 { a: Int; }
struct S2 { b: String; }
struct S3 { c: Bool; }

struct Combined {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract DeepCombine {
    rec: Combined;

    init() {
        self.rec = Combined{
            s1: S1{ a: 1 },
            s2: S2{ b: "hello" },
            s3: S3{ c: false }
        };
    }
}