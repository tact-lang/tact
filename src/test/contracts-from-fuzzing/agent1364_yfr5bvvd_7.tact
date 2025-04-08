struct S1 { a: Int; }
struct S2 { a: Int; nested: S1; }
struct S3 { a: Int; nested: S2; }
struct S4 { a: Int; nested: S3; }

contract Test {
    data: S4;
    init() {
        self.data = S4{
            a:1,
            nested: S3{
                a:2,
                nested: S2{
                    a:3,
                    nested: S1{a:4}
                }
            }
        };
    }
}
