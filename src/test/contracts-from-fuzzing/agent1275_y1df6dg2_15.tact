struct S1 { val: Int; }
struct S2 { val: Int; }
struct S3 { val: Int; }
struct S4 { s1: S1; s2: S2; s3: S3; }

contract MultiNesting {
    nested: S4;

    init() {
        self.nested = S4{
            s1: S1{val:1},
            s2: S2{val:2},
            s3: S3{val:3},
        };
    }
}