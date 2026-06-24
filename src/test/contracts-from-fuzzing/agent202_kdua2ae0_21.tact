struct DeepChain1 {
    s: DeepChain2;
}
struct DeepChain2 {
    s: DeepChain3;
}
struct DeepChain3 {
    s: DeepChain4;
}
struct DeepChain4 {
    s: DeepChain5;
}
struct DeepChain5 {
    val: Int;
}

contract DeepChainStructContract {
    val: DeepChain1;

    init() {
        self.val = DeepChain1{
            s: DeepChain2{
                s: DeepChain3{
                    s: DeepChain4{
                        s: DeepChain5{
                            val: 1
                        }
                    }
                }
            }
        };
    }
}