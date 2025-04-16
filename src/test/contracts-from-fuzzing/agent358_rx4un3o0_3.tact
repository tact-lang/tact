struct DeepLevel3 {
    v3: Int = 3;
}

struct DeepLevel2 {
    v2: DeepLevel3;
}

struct DeepLevel1 {
    v1: DeepLevel2;
}

contract DeepNestTest {
    deep: DeepLevel1;

    init() {
        self.deep = DeepLevel1{
            v1: DeepLevel2{
                v2: DeepLevel3{v3: 99}
            }
        };
    }
}
