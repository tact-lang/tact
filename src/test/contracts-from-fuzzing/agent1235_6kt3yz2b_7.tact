struct DeepChain1 { x: Int; }
struct DeepChain2 { prev: DeepChain1; }
struct DeepChain3 { prev: DeepChain2; }
struct DeepChain4 { prev: DeepChain3; }
struct DeepChain5 { prev: DeepChain4; }

contract ChainHolder {
    chain: DeepChain5;

    init() {
        self.chain = DeepChain5{
            prev: DeepChain4{
                prev: DeepChain3{
                    prev: DeepChain2{
                        prev: DeepChain1{ x: 42 },
                    },
                },
            },
        };
    }
}
