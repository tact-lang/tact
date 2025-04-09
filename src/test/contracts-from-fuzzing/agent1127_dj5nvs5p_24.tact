struct S1 { a: Int }
struct S2 { a: Int; s1: S1 }
struct S3 { s2: S2 }

contract DeepAssign {
    val: S3;

    init() {
        self.val = S3{
            s2: S2{
                a: 1,
                s1: S1{ a: 42 },
            },
        };
        self.val.s2.s1.a = 99;
    }
}
