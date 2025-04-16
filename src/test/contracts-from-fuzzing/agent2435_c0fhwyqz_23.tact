struct DeepChain1 {
    deep: DeepChain2;
}
struct DeepChain2 {
    deep: DeepChain3;
}
struct DeepChain3 {
    deep: DeepChain4;
}
struct DeepChain4 {
    deep: DeepChain5;
}
struct DeepChain5 {
    val: Int;
}
contract TestContract {
    data: DeepChain1;

    init() {
        self.data = DeepChain1{
            deep: DeepChain2{
                deep: DeepChain3{
                    deep: DeepChain4{
                        deep: DeepChain5{
                            val: 55
                        }
                    }
                }
            }
        };
    }
}