struct DeepLevel3 {
    z: Int;
}

struct DeepLevel2 {
    y: DeepLevel3;
}

struct DeepLevel1 {
    x: DeepLevel2;
}

contract DeepNestedStorage {
    nested: DeepLevel1;

    init() {
        self.nested = DeepLevel1{
            x: DeepLevel2{
                y: DeepLevel3{
                    z: 123
                }
            }
        };
    }
}