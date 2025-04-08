struct LongChain1 {
    next: LongChain2?;
    val: Int;
}

struct LongChain2 {
    next: LongChain3?;
    val: Int;
}

struct LongChain3 {
    val: Int;
}

contract ChainOptionalTest {
    chain: LongChain1?;

    init() {
        self.chain = LongChain1{
            next: LongChain2{
                next: LongChain3{
                    val: 999
                },
                val: 555
            },
            val: 111
        };
    }
}