struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }

struct BigNest {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract ManyNestedTypes {
    val: BigNest;

    init() {
        self.val = BigNest{
            s1: S1{a: 1},
            s2: S2{b: true},
            s3: S3{c: "abc"},
        };
    }
}