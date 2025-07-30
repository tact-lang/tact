struct DeepLevel3 {
    x: Int;
}

struct DeepLevel2 {
    l3: DeepLevel3;
}

struct DeepLevel1 {
    l2: DeepLevel2;
}

contract TestContract {
    deep: DeepLevel1;

    init() {
        self.deep = DeepLevel1{
            l2: DeepLevel2{
                l3: DeepLevel3{
                    x: 42
                }
            }
        };
    }
}