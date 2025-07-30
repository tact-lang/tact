struct S1 {
    x: Int;
}

struct S2 {
    sx: S1;
}

struct S3 {
    sy: S2;
}

contract DeepChainTest {
    chain: S3;

    init() {
        self.chain = S3{
            sy: S2{
                sx: S1{
                    x: 42
                }
            }
        };
    }
}