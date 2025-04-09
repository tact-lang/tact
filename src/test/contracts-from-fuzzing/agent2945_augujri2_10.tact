struct DeepNested {
    level1: Int;
    level2: DeepNested2;
}

struct DeepNested2 {
    level3: Bool;
    level4: DeepNested3;
}

struct DeepNested3 {
    level5: Int?;
}

contract VeryDeep {
    dn: DeepNested;

    init() {
        self.dn = DeepNested{
            level1: 1,
            level2: DeepNested2{
                level3: true,
                level4: DeepNested3{
                    level5: null
                }
            }
        };
    }
}