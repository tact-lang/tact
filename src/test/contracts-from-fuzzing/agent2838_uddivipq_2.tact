struct DeepNestLevel3 {
    x: Int;
}

struct DeepNestLevel2 {
    y: DeepNestLevel3;
}

struct DeepNestLevel1 {
    z: DeepNestLevel2;
}

contract DeepContract {
    val: DeepNestLevel1;

    init() {
        self.val = DeepNestLevel1 {
            z: DeepNestLevel2 {
                y: DeepNestLevel3 {
                    x: 123
                }
            }
        };
    }
}