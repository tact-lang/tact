struct DeepChain1 { one: Int }
struct DeepChain2 { two: DeepChain1 }
struct DeepChain3 { three: DeepChain2 }
struct DeepChain4 { four: DeepChain3 }
struct DeepChain5 { five: DeepChain4 }

contract ReallyDeepChain {
    x: DeepChain5;

    init() {
        self.x = DeepChain5{
            five: DeepChain4{
                four: DeepChain3{
                    three: DeepChain2{
                        two: DeepChain1{one: 77}
                    }
                }
            }
        };
    }
}