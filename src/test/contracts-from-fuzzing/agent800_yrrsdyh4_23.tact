struct DeepChain1 {
    next: DeepChain2?;
}

struct DeepChain2 {
    next: DeepChain3?;
}

struct DeepChain3 {
    next: DeepChain4?;
}

struct DeepChain4 {
    next: DeepChain5?;
}

struct DeepChain5 {
    leaf: Int;
}

contract ChainTest {
    chain: DeepChain1;

    init() {
        self.chain = DeepChain1{
            next: DeepChain2{
                next: DeepChain3{
                    next: DeepChain4{
                        next: DeepChain5{
                            leaf: 42,
                        },
                    },
                },
            },
        };
    }
}