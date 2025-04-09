struct DeepLevel3 {
    z: Int;
}

struct DeepLevel2 {
    y: DeepLevel3;
}

struct DeepLevel1 {
    x: DeepLevel2;
}

contract DeepNestTest {
    data: DeepLevel1;

    init() {
        self.data = DeepLevel1{
            x: DeepLevel2{
                y: DeepLevel3{
                    z: 123
                }
            }
        };
    }
}