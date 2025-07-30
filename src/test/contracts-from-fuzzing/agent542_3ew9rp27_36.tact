struct DeepChain1 { val: Int; }
struct DeepChain2 { nested: DeepChain1; }
struct DeepChain3 { nested: DeepChain2; }
struct DeepChain4 { nested: DeepChain3; }
struct DeepChain5 { nested: DeepChain4; }
struct DeepChain6 { nested: DeepChain5; }

contract ChainTest {
    data: DeepChain6;

    init() {
        self.data = DeepChain6{
            nested: DeepChain5{
                nested: DeepChain4{
                    nested: DeepChain3{
                        nested: DeepChain2{
                            nested: DeepChain1{ val: 100 }
                        }
                    }
                }
            }
        };
    }
}