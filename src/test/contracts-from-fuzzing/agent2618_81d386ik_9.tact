struct DeepChainA {
    next: DeepChainB;
}
struct DeepChainB {
    next: DeepChainC;
}
struct DeepChainC {
    next: DeepChainD;
}
struct DeepChainD {
    value: Int;
}

contract DeepChainContract {
    chain: DeepChainA;

    init() {
        self.chain = DeepChainA{
            next: DeepChainB{
                next: DeepChainC{
                    next: DeepChainD{ value: 123 }
                }
            }
        };
    }
}