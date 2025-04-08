struct LongChain1 { a: Int; b: LongChain2; }
struct LongChain2 { a: Int; b: LongChain3; }
struct LongChain3 { a: Int; b: LongChain4; }
struct LongChain4 { a: Int; b: LongChain5; }
struct LongChain5 { a: Int; }

contract ChainTest {
    ch: LongChain1;

    init() {
        self.ch = LongChain1 {
            a: 1,
            b: LongChain2 {
                a: 2,
                b: LongChain3 {
                    a: 3,
                    b: LongChain4 {
                        a: 4,
                        b: LongChain5 {
                            a: 5
                        }
                    }
                }
            }
        };
    }
}