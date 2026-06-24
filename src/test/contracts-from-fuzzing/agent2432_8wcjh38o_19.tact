struct S1 { a: Int; }
struct S2 { b: Int; s1: S1; }
struct S3 { c: Int; s2: S2; }
struct S4 { d: Int; s3: S3; }

contract Test {
    val: S4;
    init() {
        self.val = S4{
            d: 1,
            s3: S3{
                c: 2,
                s2: S2{
                    b: 3,
                    s1: S1{ a: 4 }
                }
            }
        };
    }
}