struct DeepChain3 {
    val: Int;
}

struct DeepChain2 {
    nested: DeepChain3;
}

struct DeepChain1 {
    nested: DeepChain2;
}

contract ChainContract {
    chain: DeepChain1;

    init() {
        self.chain = DeepChain1{ nested: DeepChain2{ nested: DeepChain3{ val: 42 } } };
    }
}