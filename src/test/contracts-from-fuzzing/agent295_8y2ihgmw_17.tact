struct DeepChain1 { next: DeepChain2; a: Int; }
struct DeepChain2 { next: DeepChain3; b: Int; }
struct DeepChain3 { next: DeepChain4; c: Int; }
struct DeepChain4 { next: DeepChain5; d: Int; }
struct DeepChain5 { leafVal: Int; }

contract DeepChainTest {
    dc: DeepChain1;

    init() {
        self.dc = DeepChain1{
            next: DeepChain2{
                next: DeepChain3{
                    next: DeepChain4{
                        next: DeepChain5{
                            leafVal: 999
                        },
                        d: 4
                    },
                    c: 3
                },
                b: 2
            },
            a: 1
        };
    }
}