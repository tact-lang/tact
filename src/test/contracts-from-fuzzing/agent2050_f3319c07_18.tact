struct LongChain1 {
    x: Int;
}
struct LongChain2 {
    prev: LongChain1;
}
struct LongChain3 {
    prev: LongChain2;
}
struct LongChain4 {
    prev: LongChain3;
}

contract ChainTest {
    data: LongChain4;

    init() {
        self.data = LongChain4{
            prev: LongChain3{
                prev: LongChain2{
                    prev: LongChain1{
                        x: 99
                    }
                }
            }
        };
    }
}