struct DeepChain1 { val: Int; }
struct DeepChain2 { next: DeepChain1; }
struct DeepChain3 { next: DeepChain2; }
struct DeepChain4 { next: DeepChain3; }
struct DeepChain5 { next: DeepChain4; }

contract ChainFive {
    c: DeepChain5;

    init() {
        self.c = DeepChain5{
            next: DeepChain4{
                next: DeepChain3{
                    next: DeepChain2{
                        next: DeepChain1{ val: 42 }
                    }
                }
            }
        };
    }
}