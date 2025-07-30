struct LongChain4 { v4: Int; }
struct LongChain3 { v3: LongChain4; }
struct LongChain2 { v2: LongChain3; }
struct LongChain1 { v1: LongChain2; }

contract ChainPersist {
    st: LongChain1;

    init() {
        self.st = LongChain1{
            v1: LongChain2{
                v2: LongChain3{
                    v3: LongChain4{ v4: 999 }
                }
            }
        };
    }
}