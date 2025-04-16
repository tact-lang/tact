struct S1 { a: Int; b: Int }
struct S2 { c: Int; d: Int }

struct S3 {
    s1: S1;
    s2: S2;
    optional: Int?;
}

contract NestedMix {
    field: S3;

    init() {
        self.field = S3{
            s1: S1{a:1,b:2},
            s2: S2{c:3,d:4},
            optional: null
        };
    }
}