struct S0 { a: Int; }
struct S1 { a: S0; }
struct S2 { a: S1; }
struct S3 { a: S2; }
struct S4 { a: S3; }

contract DeepChainContract {
    val: S4;

    init() {
        self.val = S4{
            a: S3{
                a: S2{
                    a: S1{
                        a: S0{
                            a: 99,
                        },
                    },
                },
            },
        };
    }
}