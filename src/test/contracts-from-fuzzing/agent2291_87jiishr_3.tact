struct DeepLevel3 {
    z: Int;
}

struct DeepLevel2 {
    y: DeepLevel3;
}

struct DeepLevel1 {
    x: DeepLevel2;
}

contract DeepChainStorage {
    root: DeepLevel1;

    init() {
        self.root = DeepLevel1{
            x: DeepLevel2{
                y: DeepLevel3{
                    z: 7
                }
            }
        };
    }
}
