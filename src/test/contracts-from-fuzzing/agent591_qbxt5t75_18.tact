struct DeepChain1 {
    a: DeepChain2;
}

struct DeepChain2 {
    b: DeepChain3;
}

struct DeepChain3 {
    c: DeepChain4;
}

struct DeepChain4 {
    d: DeepChain5;
}

struct DeepChain5 {
    e: Int;
}

contract DeepContract {
    chain: DeepChain1;

    init() {
        self.chain = DeepChain1{
            a: DeepChain2{
                b: DeepChain3{
                    c: DeepChain4{
                        d: DeepChain5{
                            e: 999
                        }
                    }
                }
            }
        };
    }
}