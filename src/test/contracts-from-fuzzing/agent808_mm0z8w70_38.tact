struct DeepChain1 { x: Int }
struct DeepChain2 { x: DeepChain1 }
struct DeepChain3 { x: DeepChain2 }
struct DeepChain4 { x: DeepChain3 }
struct DeepChain5 { x: DeepChain4 }
struct DeepChain6 { x: DeepChain5 }
struct DeepChain7 { x: DeepChain6 }
contract DeepChainContract {
    val: DeepChain7;

    init() {
        self.val = DeepChain7{ x: DeepChain6{ x: DeepChain5{ x: DeepChain4{ x: DeepChain3{ x: DeepChain2{ x: DeepChain1{ x:111 } } } } } } };
    }
}