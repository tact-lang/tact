struct S1 { a: Int; }
struct S2 { a: Int; b: S1; }
struct S3 { a: Int; b: S2; }
struct S4 { a: Int; b: S3; }
struct S5 { a: Int; b: S4; }

contract DeeplyNested5 {
    field: S5;
    init() {
        self.field = S5{
            a:1,
            b: S4{
                a:2,
                b: S3{
                    a:3,
                    b: S2{
                        a:4,
                        b: S1{ a:5 }
                    }
                }
            }
        };
    }
}