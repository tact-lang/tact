struct DeepNestLevel3 {
    val: Int;
}

struct DeepNestLevel2 {
    lvl3: DeepNestLevel3;
}

struct DeepNestLevel1 {
    lvl2: DeepNestLevel2;
}

contract DeepNestContract {
    lvl1: DeepNestLevel1;

    init() {
        self.lvl1 = DeepNestLevel1{
            lvl2: DeepNestLevel2{
                lvl3: DeepNestLevel3{val: 123}
            }
        };
    }
}