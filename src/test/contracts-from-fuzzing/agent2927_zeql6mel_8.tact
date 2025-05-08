struct DeepChain4 { d: Int; }
struct DeepChain3 { c: DeepChain4; }
struct DeepChain2 { b: DeepChain3; }
struct DeepChain1 { a: DeepChain2; }

contract DepthChainTest {
    root: DeepChain1;

    init() {
        self.root = DeepChain1{
            a: DeepChain2{
                b: DeepChain3{
                    c: DeepChain4{ d: 777 }
                }
            }
        };
    }
}