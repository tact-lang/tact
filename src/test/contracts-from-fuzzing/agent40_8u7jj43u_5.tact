struct DeepChain1 { x: Int; }
struct DeepChain2 { next: DeepChain1; }
struct DeepChain3 { next: DeepChain2; }
struct DeepChain4 { next: DeepChain3; }
struct DeepChain5 { next: DeepChain4; }

contract TestDeepChain {
    data: DeepChain5;

    init() {
        self.data = DeepChain5{
            next: DeepChain4{next: DeepChain3{next: DeepChain2{next: DeepChain1{x: 123}}}}
        };
    }

    receive() {
        let tmp = self.data;
    }
}