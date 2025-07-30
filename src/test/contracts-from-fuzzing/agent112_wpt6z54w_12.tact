struct S1 { v: Int; }
struct S2 { a: S1; }
struct S3 { b: S2; }
struct S4 { c: S3; }

contract TestContract {
    chain: S4;

    init() {
        self.chain = S4{
            c: S3{
                b: S2{
                    a: S1{
                        v: 12345
                    }
                }
            }
        };
    }
}