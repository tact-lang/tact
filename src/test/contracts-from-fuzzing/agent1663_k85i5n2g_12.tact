struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    inner: S1;
}

struct S3 {
    c: Int;
    inner: S2;
}

struct S4 {
    d: Int;
    inner: S3;
}

contract DeepChain {
    chain: S4;
    init() {
        self.chain = S4{
            d:4,
            inner: S3{
                c:3,
                inner: S2{
                    b:2,
                    inner: S1{a:1}
                }
            }
        };
    }
}