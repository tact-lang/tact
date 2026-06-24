struct DeepNestOption {
    lvl1: Int?;
    lvl2: DeepNestOption2;
}

struct DeepNestOption2 {
    lvl3: DeepNestOption3?;
}

struct DeepNestOption3 {
    lvl4: Int;
}

contract DeepOptionTest {
    nested: DeepNestOption;
    init() {
        self.nested = DeepNestOption{
            lvl1: 1,
            lvl2: DeepNestOption2{
                lvl3: DeepNestOption3{
                    lvl4: 4
                }
            }
        };
    }
}