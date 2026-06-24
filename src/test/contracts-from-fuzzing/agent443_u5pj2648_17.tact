struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { c: Int; }

struct Combo {
    s1: S1?;
    s2: S2?;
    s3: S3?;
}

contract MultiNullableStructs {
    combo: Combo;

    init() {
        self.combo = Combo{ s1: null, s2: null, s3: null };
    }
}