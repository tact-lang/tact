struct DeepChainLevel3 {
    baz: Int;
}

struct DeepChainLevel2 {
    bar: DeepChainLevel3;
}

struct DeepChainLevel1 {
    foo: DeepChainLevel2;
}

contract TestContract {
    deepChain: DeepChainLevel1;

    init() {
        self.deepChain = DeepChainLevel1{
            foo: DeepChainLevel2{
                bar: DeepChainLevel3{
                    baz: 42
                }
            }
        };
    }
}