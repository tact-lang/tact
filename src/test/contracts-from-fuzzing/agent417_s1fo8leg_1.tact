struct DeepNestLevel3 {
    z: Int;
}

struct DeepNestLevel2 {
    y: Int;
    lvl3: DeepNestLevel3;
}

struct DeepNestLevel1 {
    x: Int;
    lvl2: DeepNestLevel2;
}

contract TestContract {
    nested: DeepNestLevel1;

    init() {
        self.nested = DeepNestLevel1{
            x: 1,
            lvl2: DeepNestLevel2{
                y: 2,
                lvl3: DeepNestLevel3{
                    z: 3
                }
            }
        };
    }
}