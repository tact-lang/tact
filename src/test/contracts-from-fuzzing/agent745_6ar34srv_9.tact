struct S1 {
    num: Int;
}

struct S2 {
    prev: S1;
}

struct S3 {
    prev: S2;
}

struct S4 {
    prev: S3;
}

contract NestedChainTest {
    chain: S4;
    init() {
        self.chain = S4{
            prev: S3{
                prev: S2{
                    prev: S1{
                        num: 777
                    }
                }
            }
        };
    }
}