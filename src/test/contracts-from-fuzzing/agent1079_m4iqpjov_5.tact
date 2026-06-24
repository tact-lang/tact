struct DeepLevel3 {
    value: Int;
}

struct DeepLevel2 {
    l3: DeepLevel3;
}

struct DeepLevel1 {
    l2: DeepLevel2;
}

contract DeepNestTest {
    nested: DeepLevel1;

    init() {
        self.nested = DeepLevel1{
            l2: DeepLevel2{
                l3: DeepLevel3{
                    value: 123
                }
            }
        };
    }
}