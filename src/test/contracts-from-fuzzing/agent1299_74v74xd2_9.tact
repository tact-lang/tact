struct DeepChain1 { next: DeepChain2; }
struct DeepChain2 { next: DeepChain3; }
struct DeepChain3 { next: DeepChain4; }
struct DeepChain4 { next: DeepChain5; }
struct DeepChain5 { val: Int; }

contract DeepChainHolder {
    pointer: DeepChain1;

    init() {
        self.pointer = DeepChain1{
            next: DeepChain2{
                next: DeepChain3{
                    next: DeepChain4{
                        next: DeepChain5{
                            val: 123
                        }
                    }
                }
            }
        };
    }
}
