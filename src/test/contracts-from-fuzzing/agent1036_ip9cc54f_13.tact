struct DeepChain1 {
    s2: DeepChain2;
}
struct DeepChain2 {
    s3: DeepChain3;
}
struct DeepChain3 {
    s4: DeepChain4;
}
struct DeepChain4 {
    val: Int;
}

contract FourDeepChain {
    field: DeepChain1;
    init() {
        self.field = DeepChain1{ s2: DeepChain2{ s3: DeepChain3{ s4: DeepChain4{ val: 7 } } } };
    }
}