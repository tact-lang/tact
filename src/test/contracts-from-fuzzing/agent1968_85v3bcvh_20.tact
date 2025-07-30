struct S1 { a: Int; }
struct S2 { b: Int; s1: S1; }
struct S3 { c: Int; s2: S2; }

contract Test21 {
    val: S3;
    init() {
        self.val = S3{
            c:3,
            s2: S2{ b:2, s1: S1{a:1} }
        };
    }
}