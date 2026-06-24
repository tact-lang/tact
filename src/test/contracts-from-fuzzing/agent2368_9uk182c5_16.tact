struct S0 { a: Int; }
struct S1 { a: Int; inner0: S0; }
struct S2 { a: Int; inner1: S1; }
struct S3 { a: Int; inner2: S2; }

contract DeepChain {
    data: S3;

    init() {
        self.data = S3{
            a: 10,
            inner2: S2{
                a: 20,
                inner1: S1{
                    a: 30,
                    inner0: S0{ a: 40 }
                }
            }
        };
    }
}