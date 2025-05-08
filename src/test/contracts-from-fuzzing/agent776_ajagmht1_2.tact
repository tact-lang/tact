struct DeepLevel3 {
    x: Int;
}

struct DeepLevel2 {
    nested: DeepLevel3;
}

struct DeepLevel1 {
    nested: DeepLevel2;
}

contract DeepTest {
    data: DeepLevel1;
    init() {
        self.data = DeepLevel1{
            nested: DeepLevel2{
                nested: DeepLevel3{
                    x: 999
                }
            }
        };
    }
}