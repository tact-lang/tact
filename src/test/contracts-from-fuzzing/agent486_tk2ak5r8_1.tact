struct DeepNested {
    level1: InnerLevel1;
}

struct InnerLevel1 {
    level2: InnerLevel2;
}

struct InnerLevel2 {
    level3: InnerLevel3;
}

struct InnerLevel3 {
    val: Int;
}

contract TestDeepNested {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            level1: InnerLevel1{
                level2: InnerLevel2{
                    level3: InnerLevel3{
                        val: 123
                    }
                }
            }
        };
    }
}
