struct S5 { e: Int; }
struct S4 { d: Int; next: S5; }
struct S3 { c: Int; next: S4; }
struct S2 { b: Int; next: S3; }
struct S1 { a: Int; next: S2; }

contract DeepChain {
    receive() {
        let chain = S1{
            a: 1,
            next: S2{
                b: 2,
                next: S3{
                    c: 3,
                    next: S4{
                        d: 4,
                        next: S5{ e: 5 }
                    }
                }
            }
        };
        chain.next.next.next.next.e;
    }
}
