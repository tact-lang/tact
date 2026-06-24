struct BoolChain1 { f1: Bool; }
struct BoolChain2 { f2: BoolChain1; }
struct BoolChain3 { f3: BoolChain2; }
struct BoolChain4 { f4: BoolChain3; }
struct BoolChain5 { f5: BoolChain4; }

contract ChainBool {
    chain: BoolChain5;

    init() {
        self.chain = BoolChain5{ f5: BoolChain4{ f4: BoolChain3{ f3: BoolChain2{ f2: BoolChain1{ f1: true } } } } };
    }
}