struct DeepChain1 {
    next: DeepChain2;
}
struct DeepChain2 {
    next: DeepChain3;
}
struct DeepChain3 {
    next: DeepChain4;
}
struct DeepChain4 {
    leaf: Bool;
}

contract DeepFieldChain {
    data: DeepChain1;

    init() {
        self.data = DeepChain1{
            next: DeepChain2{
                next: DeepChain3{
                    next: DeepChain4{leaf:true}
                }
            }
        };
    }
}