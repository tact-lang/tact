struct DeepLevel3 {
    z: Int?;
}

struct DeepLevel2 {
    y: DeepLevel3;
}

struct DeepLevel1 {
    x: DeepLevel2;
}

contract DeepOptionals {
    data: DeepLevel1;

    init() {
        self.data = DeepLevel1 {
            x: DeepLevel2 {
                y: DeepLevel3 {
                    z: null
                }
            }
        };
    }
}