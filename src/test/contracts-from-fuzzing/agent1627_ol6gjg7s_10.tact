struct DeepChain1 { a: Int; }
struct DeepChain2 { nested: DeepChain1; }
struct DeepChain3 { nested: DeepChain2; }
struct DeepChain4 { nested: DeepChain3; }
struct DeepChain5 { nested: DeepChain4; }

contract DeepChainContract {
    data: DeepChain5;

    init() {
        self.data = DeepChain5{
            nested: DeepChain4{
                nested: DeepChain3{
                    nested: DeepChain2{
                        nested: DeepChain1{
                            a: 100
                        }
                    }
                }
            }
        };
    }
}
