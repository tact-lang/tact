struct DeepChain1 { x: Int; next: DeepChain2; }
struct DeepChain2 { x: Int; next: DeepChain3; }
struct DeepChain3 { x: Int; next: DeepChain4; }
struct DeepChain4 { x: Int; }

contract Linked {
    data: DeepChain1;

    init() {
        self.data = DeepChain1{
            x: 1,
            next: DeepChain2{
                x: 2,
                next: DeepChain3{
                    x: 3,
                    next: DeepChain4{
                        x: 4
                    }
                }
            }
        };
    }
}