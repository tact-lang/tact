struct S1 { a: Int }
struct S2 { b: S1 }
struct S3 { c: S2 }
struct S4 { d: S3 }

contract ChainInside {
    field: S4;

    init() {
        self.field = S4{
            d: S3{
                c: S2{
                    b: S1{a: 10}
                }
            }
        };
    }
}