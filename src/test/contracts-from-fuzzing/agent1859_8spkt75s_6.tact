struct DeepLevel3 {
    val: Int;
}

struct DeepLevel2 {
    nested: DeepLevel3;
}

struct DeepLevel1 {
    nested: DeepLevel2;
}

contract NestedDeepChain {
    chain: DeepLevel1;

    init() {
        self.chain = DeepLevel1{
            nested: DeepLevel2{
                nested: DeepLevel3{
                    val: 2024
                }
            }
        };
    }
}