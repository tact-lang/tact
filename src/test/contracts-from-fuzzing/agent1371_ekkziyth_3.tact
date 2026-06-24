struct DeepLevel3 {
    val: Int;
}

struct DeepLevel2 {
    next: DeepLevel3;
}

struct DeepLevel1 {
    next: DeepLevel2;
}

contract DeepChain {
    chain: DeepLevel1;

    init() {
        self.chain = DeepLevel1{
            next: DeepLevel2{
                next: DeepLevel3{ val: 123 }
            }
        };
    }
}