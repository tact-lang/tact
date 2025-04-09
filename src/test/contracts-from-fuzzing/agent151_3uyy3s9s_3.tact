struct DeepLevel3 {
    val: Bool?;
}

struct DeepLevel2 {
    lvl3: DeepLevel3;
}

struct DeepLevel1 {
    lvl2: DeepLevel2;
}

contract TestVeryDeepNested {
    deep: DeepLevel1;

    init() {
        self.deep = DeepLevel1{
            lvl2: DeepLevel2{
                lvl3: DeepLevel3{
                    val: true
                }
            }
        };
    }
}