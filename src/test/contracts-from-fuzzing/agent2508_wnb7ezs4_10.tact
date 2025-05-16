struct S1 { a: Int; }
struct S2 { a: S1; }
struct S3 { a: S2; }
struct S4 { a: S3; }

contract MultiNest {
    nested: S4;

    init() {
        self.nested = S4{
            a: S3{
                a: S2{
                    a: S1{ a: 555 }
                }
            }
        };
    }
}
