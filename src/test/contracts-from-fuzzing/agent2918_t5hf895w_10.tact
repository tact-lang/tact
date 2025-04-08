struct S1 { a: Int; }
struct S2 { a: Int; s1: S1; }
struct S3 { a: Int?; s2: S2; s1opt: S1?; }

contract TestContract {
    val: S3;

    init() {
        self.val = S3{
            a: null,
            s2: S2{
                a:2,
                s1:S1{a:1}
            },
            s1opt:null
        };
    }
}