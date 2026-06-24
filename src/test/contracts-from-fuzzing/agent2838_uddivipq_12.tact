struct LargeChain1 { a: Int; }
struct LargeChain2 { b: LargeChain1; }
struct LargeChain3 { c: LargeChain2; }
struct LargeChain4 { d: LargeChain3; }

contract ChainTest {
    chain: LargeChain4;

    init() {
        self.chain = LargeChain4 {
            d: LargeChain3 {
                c: LargeChain2 {
                    b: LargeChain1 { a: 100 }
                }
            }
        };
    }
}