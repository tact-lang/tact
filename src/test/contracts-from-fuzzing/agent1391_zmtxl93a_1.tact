struct DeepNestLevel3 {
    value: Int;
}

struct DeepNestLevel2 {
    lvl3: DeepNestLevel3;
}

struct DeepNestLevel1 {
    lvl2: DeepNestLevel2;
}

contract DeepNest {
    data: DeepNestLevel1;

    init() {
        self.data = DeepNestLevel1{
            lvl2: DeepNestLevel2{
                lvl3: DeepNestLevel3{
                    value: 42
                }
            }
        };
    }
}