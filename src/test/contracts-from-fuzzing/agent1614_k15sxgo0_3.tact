struct DeepLevel3 {
    val: Int?;
}

struct DeepLevel2 {
    lvl3: DeepLevel3;
}

struct DeepLevel1 {
    lvl2: DeepLevel2;
}

contract Test3 {
    deep: DeepLevel1;

    init() {
        self.deep = DeepLevel1{
            lvl2: DeepLevel2{
                lvl3: DeepLevel3{val: null}
            }
        };
    }
}